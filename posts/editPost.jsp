<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/new.css" />
<title>게시글 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 게시글를 삭제합니다!!") == true)
			location.href = "./deletePost.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="updatePost" />
				</h1>
			</div>
		</div>
		<div class="container">
			<div class = "row">
			<div class = "col" align = "left">
				<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<div class="col" align = "right">
			<%
				if (edit.equals("update")) {
			%>
			<a href="editPost.jsp?edit=update&language=ko">Korean</a> | <a href="editPost.jsp?edit=update&language=en">English</a>			
			<%
				} else if (edit.equals("delete")) {
			%>
			<a href="editPost.jsp?edit=delete&language=ko">Korean</a> | <a href="editPost.jsp?edit=delete&language=en">English</a>			
			<%
				}
			%>
			</div>
			</div>
			
			<br>
			<%if (edit.equals("update") || edit.equals("delete")) {
					%>
					<div class="col" align="right" style="padding-right: 0px;">
						<p> <a href="posts.jsp" class="btn btn-warning"><fmt:message key="finish" /> &raquo;</a>
					</div>
					<%
					}
				%>
			<%@ include file="../dbconn.jsp"%>
			<div class="col" align="left">
				<%
					String sql = "select * from posts ORDER BY p_id DESC";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
					java.util.Date day = new java.util.Date();
					int year = day.getYear() + 1900;
					int month = day.getMonth() + 1;
					int days = day.getDate();
				%>
				<div  class="row" id="posts" align="center">
					<div class="col" align="center">
						<div class="row" align="left">
							<h5>
								[<%=rs.getString("p_category")%>]
								<%=rs.getString("p_title")%>
							</h5>
							<br>
						</div>
						<div class="row" align="left">
						<div class="col" align="left" style="padding-left: 0px; padding-right: 0px;">
							<p>
								<%
								StringTokenizer st = new StringTokenizer(rs.getString("p_date"));
								String buf = st.nextToken().trim();
								StringTokenizer st2 = new StringTokenizer(buf, ".");
								if (st2.nextToken().equals(Integer.toString(year))) {
									if (st2.nextToken().equals(Integer.toString(month))) {
										if (days - Integer.parseInt(st2.nextToken()) < 1) {
									out.println("<span id = 'NEW' class = 'image blinking'>[NEW]</span>&nbsp;");
										}
									}
								}
								%>
								<%=rs.getString("p_date")%>
						</div>
						<div class="text-right">
						<%
						if (edit.equals("update")) {
						%>
						<a href="./updatePost.jsp?id=<%=rs.getString("p_id")%>"
							class="btn btn-success" role="button"> <fmt:message key="update" /> &raquo;></a>
						<%
						} else if (edit.equals("delete")) {
						%>
						<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
							class="btn btn-danger" role="button"><fmt:message key="delete" /> &raquo;></a>
						<%
						}
						%>
						</div>
						</div>
					</div>
				</div>
				<hr>
				<%
				}
				if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
				%>
				</div>
			</div>
		<%@ include file="../footer.jsp"%>

	</fmt:bundle>
</body>
</html>
