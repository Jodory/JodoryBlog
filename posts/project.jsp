<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
        <% request.setCharacterEncoding("UTF-8"); %>
	<% RequestDispatcher rd = request.getRequestDispatcher("/MyBlog/posts/posts.jsp");
	rd.forward(request, response); %>

</body>
</html>

