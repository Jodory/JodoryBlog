<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Program"%>
<%@ page import="dao.ProgramRepository"%> --%>

<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>programs</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="programs" />
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
					<a href="./addProgram.jsp" class="btn btn-info"><fmt:message
							key="addProgram" />&raquo;</a>
					<a href="./editProgram.jsp?edit=update" class="btn btn-success"><fmt:message key="updateProgram" /> &raquo;</a>
					<a href="./editProgram.jsp?edit=delete" class="btn btn-danger"><fmt:message key="delete" /> &raquo;</a>
			</div>
			<%@ include file="../dbconn.jsp"%>
			<div class="row" align="center">
				<%
				String sql = "select * from program";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
				<div class="col-md-4">
					<div class="col">
						<img alt="사진"
							src="../resources/images/<%=rs.getString("p_fileName")%>"
							style="width: 100%; padding-bottom: 0px; margin-bottom: 20px;">
					</div>
					<p>
					<h5>
						[<%=rs.getString("p_category")%>]<%=rs.getString("p_name")%></h5>
<p><%=rs.getString("p_producer")%> | <%=rs.getString("p_unitPrice")%> <fmt:message key="won" />
					<p>
						<a href="./program.jsp?id=<%=rs.getString("p_id")%>"
							class="btn btn-secondary" role="button"><fmt:message
								key="detail" /> &raquo;</a>
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
			</div>
		</div>
		<%@ include file="../footer.jsp"%>

	</fmt:bundle>
</body>
</html>