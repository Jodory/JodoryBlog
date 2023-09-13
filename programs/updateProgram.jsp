<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

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

<title>프로그램 수정</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">프로그램 수정</h1>
			</div>
		</div>
		<%@ include file="../dbconn.jsp"%>
		<%
		String id = request.getParameter("id");

		String sql = "select * from program where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
				<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<div class="row">
				<div class="col-md-5">
					<img alt="사진"
						src="../resources/images/<%=rs.getString("p_filename")%>"
						alt="image" style="width: 100%" />
				</div>
				<div class="col-md-7">
					<form name="newProgram" action="/MyBlog/processUpdateProgram.jsp"
						class="form-horizontal" method="post"
						enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="programId" /></label>
							<div class="col-sm-3">
								<input type="text" name="programId" id="programId"
									class="form-control" value='<%=rs.getString("p_id")%>'>
								<input type="hidden" name="original_id" id="original_id"
									class="form-control" value='<%=id%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="name" /></label>
							<div class="col-sm-3">
								<input type="text" name="name" id="name" class="form-control"
									value='<%=rs.getString("p_name")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
							<div class="col-sm-3">
								<input type="text" name="unitPrice" id="unitPrice"
									class="form-control" value='<%=rs.getInt("p_unitPrice")%>'>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-2">제작자</label>
							<div class="col-sm-3">
								<input type="text" name="producer" class="form-control"
									value='<%=rs.getString("p_producer")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
							<div class="col-sm-3">
								<input type="text" name="releaseDate" class="form-control"
									value='<%=rs.getString("p_releaseDate")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">최근 업데이트일</label>
							<div class="col-sm-3">
								<input type="text" name="recentUpdate" class="form-control"
									value='<%=rs.getString("p_recentUpdate")%>' />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="category" /></label>
							<div class="col-sm-3">
								<input type="text" name="category" class="form-control"
									value='<%=rs.getString("p_category")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="content" /></label>
							<div class="col">
								<textarea name="editordata" id="summernote"><%=rs.getString("p_description")%></textarea>
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
							<label class="col-sm-2"><fmt:message key="programImage" /></label>
							<div class="col-sm-5">
								<input type="file" name="programImage" class="form-control">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" class="btn btn-primary"
									value="<fmt:message key = "button"/>" />
							</div>
						</div>
					</form>

				</div>
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
