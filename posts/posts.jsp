<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.StringTokenizer"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/new.css" />
<title>posts</title>

</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="posts" />
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<br>
			<div class="col" align="right" style="padding-right: 0px;">
				<p>
					<a href="./addPost.jsp" class="btn btn-info"><fmt:message
							key="addPost" />&raquo;</a>
					<a href="./editPost.jsp?edit=update" class="btn btn-success"><fmt:message key="updatePost" /> &raquo;</a>
					<a href="./editPost.jsp?edit=delete" class="btn btn-danger"><fmt:message key="delete" /> &raquo;</a>
			</div>
			<%@ include file="../dbconn.jsp"%>
			<div class="col" align="left">
				<%
					String sql = "select * from posts ORDER BY p_id DESC";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
					java.util.Date day = new java.util.Date();
					int year = day.getYear() + 1900;
					int month_buf = day.getMonth() + 1;
					String month = null;
					if (month_buf >= 10)
						month = Integer.toString(month_buf);
					else
						month = "0" + Integer.toString(month_buf);
					int days = day.getDate();
				%>
				<a href="./post.jsp?id=<%=rs.getString("p_id")%>" class="row" id="posts"
					align="center">
					<div class="col" align="center">
						<div class="row" align="left">
							<h5>
								[<%=rs.getString("p_category")%>]
								<%=rs.getString("p_title")%>
							</h5>
							<br>
						</div>
						<div class="row" align="left">
							<p>
								<%
								StringTokenizer st = new StringTokenizer(rs.getString("p_date"));
								String buf = st.nextToken().trim();
								StringTokenizer st2 = new StringTokenizer(buf, ".");
								if (st2.nextToken().equals(Integer.toString(year))) {
									if (st2.nextToken().equals(month)) {
										if (days - Integer.parseInt(st2.nextToken()) < 1) {
									out.println("<span id = 'NEW' class = 'image blinking'>[NEW]</span>&nbsp;");
										}
									}
								}
								%>
								<%=rs.getString("p_date")%>
						</div>
					</div>
				</a>
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
