<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/new.css" />

</head>
<body>

	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<%@ include file="../dbconn.jsp"%>
			<div class="container">
				<%
				String category = request.getParameter("category");
				String sql = "select * from posts where p_category='" + category + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int cnt = 0;
				while (rs.next()) {
					if (cnt == 0) {
						cnt++;
				%>
				<h1 class="display-3"><%=rs.getString("p_category")%></h1>
				<title><%=rs.getString("p_category")%></title>

			</div>
		</div>

		<div class="container">
			<%
			} else {
			%>
			<hr>

			<%
			}
			%>
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
			<div class="col" align="right">
				<p>
					<a href="posts.jsp" class="btn btn-info">게시글 목록 &raquo;</a>
			</div>
			<%@ include file="../footer.jsp"%>
		</div>

	</fmt:bundle>
</body>
</html>
