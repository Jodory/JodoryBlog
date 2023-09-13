<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>프로그램 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 프로그램을 삭제합니다!!") == true)
			location.href = "./deleteProgram.jsp?id=" + id;
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
				<h1 class="display-3"><fmt:message key="updateProgram" /></h1>
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
			<a href="editProgram.jsp?edit=update&language=ko">Korean</a> | <a href="editProgram.jsp?edit=update&language=en">English</a>			
			<%
				} else if (edit.equals("delete")) {
			%>
			<a href="editProgram.jsp?edit=delete&language=ko">Korean</a> | <a href="editProgram.jsp?edit=delete&language=en">English</a>			
			<%
				}
			%>
			</div>
			</div>
			
			<br>
			<%if (edit.equals("update") || edit.equals("delete")) {
					%>
					<div class="col" align="right" style="padding-right: 0px;">
						<p> <a href="programs.jsp" class="btn btn-warning"><fmt:message key="finish" /> &raquo;</a>
					</div>
					<%
					}
				%>
			
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
					<p><%=rs.getString("p_producer")%>
						|
						<%=rs.getString("p_unitPrice")%>
						<fmt:message key="won" />
					<p>
						<%
						if (edit.equals("update")) {
						%>
						<a href="./updateProgram.jsp?id=<%=rs.getString("p_id")%>"
							class="btn btn-success" role="button"> <fmt:message key="update" /> &raquo;></a>
						<%
						} else if (edit.equals("delete")) {
						%>
						<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
							class="btn btn-danger" role="button"><fmt:message key="delete" />  &raquo;></a>
						<%
						}
						%>
					
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
			<br> <br>
			<%
			if (edit.equals("update") || edit.equals("delete")) {
			%>
			<div class="col" align="right">
				<p>
					<a href="programs.jsp" class="btn btn-warning">완료 &raquo;</a>
			</div>
			<%
			}
			%>

		</div>
		<%@ include file="../footer.jsp"%>

	</fmt:bundle>
</body>
</html>