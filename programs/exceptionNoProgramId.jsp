<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/MyBlog/resources/css/bootstrap.min.css" />
<title>프로그램 아이디 오류</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h2 class="alert alert-danger">해당 프로그램이 존재하지 않습니다.</h2>
			</div>
		</div>

		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<P><%=request.getRequestURL()%>?<%=request.getQueryString()%>
			<p>
				<a href="./programs.jsp" class="btn btn-secondary">프로그램 목록
					&raquo;</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>