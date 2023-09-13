<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page errorPage="exceptionNoPostId.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/new.css" />
<title>3줄 요약</title>
</head>
<body>

	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<%@ include file="../dbconn.jsp"%>
			<div class="container">
				<%
				String id = request.getParameter("id");
				String sql = "select * from post where p_id='" + id + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
				<h1 class="display-3"><%=rs.getString("p_category")%></h1>
			</div>
		</div>

		<div class="container">
			<div class="text-right">
				<a href="?id=<%=rs.getString("p_id")%>&language=ko">Korean</a> | <a
					href="?id=<%=rs.getString("p_id")%>&language=en">English</a>
			</div>
			<br>
			<div class="row">
			
				<%
				int PostNum = rs.getInt("p_id");
				int prePost = PostNum - 1;
				int nextPost = PostNum + 1;

				int firstNum = 1;

				sql = "SELECT * FROM post ORDER BY p_id DESC LIMIT 1";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					int lastNum = rs.getInt("p_id");

					if (PostNum == lastNum) {
				%>
			
			<div class="col" align = "left">
				<a href="./post.jsp?id=<%=prePost%>" class="btn btn-secondary"
					role="button">&laquo; 이전 글</a>
			</div>
			<%
			} else if (PostNum == firstNum) {
			%>

			<div class="col" align = "right">
				<a href="./post.jsp?id=<%=nextPost%>" class="btn btn-secondary"
					role="button">다음 글 &raquo;</a>
			</div>
			<%
			} else {
			%>
			
			<div class="col" align = "left">
				<a href="./post.jsp?id=<%=prePost%>" class="btn btn-secondary"
					role="button">&laquo; 이전 글</a>
			</div>
			<div class="col" align = "right">
				<a href="./post.jsp?id=<%=nextPost%>" class="btn btn-secondary"
					role="button">다음 글 &raquo;</a>
			</div>
			
			<%
			}
			}
				id = request.getParameter("id");
				sql = "select * from post where p_id='" + id + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
			</div>
			<br>
			<div class="row">
				<div class="col-md">
					<h3>
						<%=rs.getString("p_title")%></h3>
					<br>
					<p>
						<%
						java.util.Date day = new java.util.Date();
						int year = day.getYear() + 1900;
						int month = day.getMonth() + 1;
						int days = day.getDate();
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
						<span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
						&nbsp;&nbsp; <br>
					<p><%=rs.getString("p_content")%>
						<jsp:useBean id="naver" class="naver.Api"></jsp:useBean>
					<%
					String str = rs.getString("p_content");
					str = str.replaceAll("<.*?>", "");
					/* str = str.replaceAll(":","="); */
			        str = str.replaceAll("\\s+", " ");
					/* str = str.replaceAll("(\r\n|\r|\n|\n\r)", " "); */
					str = str.replaceAll("\"", "\'");
					str = str.replaceAll("&nbsp;", "");
					str = str.replaceAll("&;", "");
					str = str.replaceAll("bsp;", "");
					
					String result =  naver.api(rs.getString("p_category"), str);
					
					/* String result= str; */
					%>
					<h5>3줄 요약: <%=result%> </h5>
						<%
						}
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
			<div class="col" align="right">
				<p><a href="posts.jsp" class="btn btn-info">게시글 목록 &raquo;</a>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>