<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Program"%>
<%@ page import="dao.ProgramRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page errorPage = "exceptionNoProgramId.jsp" %>
<html>
<!-- 완료  -->
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/new.css" />
<title>프로그램 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("해당 프로그램을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="programInfo" />
				</h1>
			</div>
		</div>
		<%@ include file="../dbconn.jsp"%>
		<%
		String id = request.getParameter("id");
		String sql = "select * from program where p_id='" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		%>

		<div class="container">
			<div class="text-right">
				<a href="?id=<%=rs.getString("p_id")%>&language=ko">Korean</a> | <a
					href="?id=<%=rs.getString("p_id")%>&language=en">English</a>
			</div>
			<div class="row">
				<div class="col-md-5">
					<img alt="사진"
						src="../resources/images/<%=rs.getString("p_fileName")%>"
						style="width: 100%;" />
				</div>
				<div class="col-md-6">
					<h5>
						[<%=rs.getString("p_category")%>]
						<%=rs.getString("p_name")%></h5>
					<br>
					<p>
						<b><fmt:message key="programId" /> : </b><span
							class="badge badge-danger"> <%=rs.getString("p_id")%></span>
					<p>
						<b><fmt:message key="producer" /></b> :
						<%=rs.getString("p_producer")%>
					<p>

						<b><fmt:message key="releaseDate" /></b> :
						<%=rs.getString("p_releaseDate")%>										<%
						java.util.Date day = new java.util.Date();
						int year = day.getYear() + 1900;
						int month = day.getMonth() + 1;
						int days = day.getDate();
						StringTokenizer st = new StringTokenizer(rs.getString("p_releaseDate"));
						String buf = st.nextToken().trim();
						StringTokenizer st2 = new StringTokenizer(buf, "/");
						if (st2.nextToken().equals(Integer.toString(year))) {
							if (st2.nextToken().equals(Integer.toString(month))) {
								if (days - Integer.parseInt(st2.nextToken()) < 7) {
							out.println("&nbsp;<span id = 'NEW' class = 'image blinking'>[NEW]</span>&nbsp;");
								}
							}
						}
						%>
					<p>
					
						<b><fmt:message key="updateDate" /></b> :
						<%=rs.getString("p_recentUpdate")%><%
						day = new java.util.Date();
						year = day.getYear() + 1900;
						month = day.getMonth() + 1;
						days = day.getDate();
						st = new StringTokenizer(rs.getString("p_recentUpdate"));
						buf = st.nextToken().trim();
						st2 = new StringTokenizer(buf, "/");
						if (st2.nextToken().equals(Integer.toString(year))) {
							if (st2.nextToken().equals(Integer.toString(month))) {
								if (days - Integer.parseInt(st2.nextToken()) < 7) {
							out.println("&nbsp;<span id = 'NEW' class = 'image blinking'>[NEW]</span>&nbsp;");
								}
							}
						}
						%>
					<p>
					<b><fmt:message key="unitPrice" /></b> :
						<%=rs.getString("p_unitPrice")%>
						<fmt:message key="won" />

						</h5><!-- 세션 추가 -->

					<p>
					<form name="addForm"
						action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()"><fmt:message
								key="programOder" /> &raquo;</a> <a href="./cart.jsp"
							class="btn btn-warning"><fmt:message key="cart" /> &raquo;</a> <a href="./programs.jsp"
							class="btn btn-secondary"><fmt:message key="programList" />
							&raquo;</a>
					</form>
					<p>
					<p>
				</div>
				<div class="col">
					<p><%=rs.getString("p_description")%>
				</div>

				<%
				}

				
				%>
			</div>

			<hr>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>