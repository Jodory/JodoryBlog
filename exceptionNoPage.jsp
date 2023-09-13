<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/MyBlog/resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
			</div>
		</div>

		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<P><%=request.getRequestURL()%></P>
			<p>
				<a href="/MyBlog/" class="btn btn-secondary">Home &raquo;</a>
		</div>
		<%@ include file="footer.jsp"%>
	</fmt:bundle>
</body>
</html>