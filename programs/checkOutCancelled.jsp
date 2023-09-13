<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>주문 취소</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">주문 취소</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
		</div>
		<div class="container">
			<p>
				<a href="./programs.jsp" class="btn btn-secondary"> &laquo; 프로그램
					목록</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>
