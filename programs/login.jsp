<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jodory">
<meta name="subtitle" content="Blog">
<meta name="description" content="Jodory's Blog">
<title>Login</title>
<!-- <link rel="icon" href="/image/favicon.ico"> -->
<link rel="stylesheet" href="../resources/css/iconfont.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"><fmt:message key = "login"/></h1>
			</div>
		</div>
		<div class="container" align="center">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<div class="col-md-4 col-md-offset-4">
				<h3 class="form-signin-heading">Please sign in</h3>
				<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class = 'alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
				%>
				<form action="j_security_check" class="form-signin" method="post">
					<div class="form-group">
						<label for="inputUserName" class="sr-only">User Name</label> <input
							type="text" class="form-control" placeholder="ID"
							name='j_username' required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only">Password</label> <input
							type="password" class="form-control" placeholder="Password"
							name='j_password' required>
					</div>
					<button class="btn btn btn-lg btn-success btn-block" type="submit"><fmt:message key = "login"/></button>
					<a class="btn btn btn-lg btn-success btn-block" href="javascript:window.history.back();"><fmt:message key = "back"/></a>
				</form>
			</div>
		</div>
	</fmt:bundle>
</body>
</html>