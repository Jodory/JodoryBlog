<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<!--forward 액션은 최종 페이지에 파라미터를 함께 전달함, 최초 요청된 페이지 url이 표시됨 -->
	<jsp:forward page="http://203.249.22.168:8080/MyBlog/posts/categoryPost.jsp?category=%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%82%B0%EC%B6%9C%EB%AC%BC"/>

</body>
</html>
