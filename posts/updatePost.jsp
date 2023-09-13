<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript"
	src="../resources/js/addPostValidation.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>게시글 수정</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"><fmt:message key="updatePost" /></h1>
			</div>
		</div>
		<%@ include file="../dbconn.jsp"%>
		<%
		String postId = request.getParameter("id");

		String sql = "select * from posts where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, postId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div class="container">
			<div class="text-right">
				<a href="?id=<%=rs.getString("p_id")%>&language=ko">Korean</a> | <a href="?id=<%=rs.getString("p_id")%>&language=en">English</a>
				<br><br>
				<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<div class="row">
				<form name="newPost" action="/MyBlog/processUpdatePost.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="mainTitle" /></label>
						<div class="col-sm-3">
							<input type="text" name="title" id="title" class="form-control"
								value='<%=rs.getString("p_title")%>' /> <input type="hidden"
								name="id" id="id" class="form-control"
								value='<%=rs.getString("p_id")%>' />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="category" /></label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value='<%=rs.getString("p_category")%>' />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="content" /></label>
						<div class="col">
							<textarea name="editordata" id="summernote"><%=rs.getString("p_content")%></textarea>
							<script>
								$(document).ready(function() {
									$("#summernote").summernote({
										height : 350
									});
								});
							</script>
						</div>
					</div>


					<div class="form-group row">
						<div class="col-sm-2 col-sm-10">
							<input type="button" class="btn btn-primary"
								value="<fmt:message key = "button"/>" onclick="CheckAddPost()" />
						</div>
					</div>
				</form>

			</div>
		</div>

		<%
		}
		if (rs != null)
		rs.close();
		if (pstmt != null)
		pstmt.close();
		if (conn != null)
		conn.close();
		%>
		<%@ include file="../footer.jsp"%>

	</fmt:bundle>
</body>
</html>
