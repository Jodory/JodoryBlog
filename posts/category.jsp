<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jodory">
<meta name="subtitle" content="Blog">
<meta name="description" content="Jodory's Blog">
<title>Category</title>
<!-- <link rel="icon" href="/image/favicon.ico"> -->
<!-- <link rel="stylesheet" href="./resources/css/style.css"> -->
<link rel="stylesheet" href="../resources/css/iconfont.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
</head>

<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<div class="wrapper">
			<%@ include file="../header.jsp"%>
			<div class="jumbotron">
				<div class="container">
					<h1 class="display-3">
						<fmt:message key="categories" />
					</h1>
				</div>
			</div>
			
				<div class="container">
					<div class="text-right">
						<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
					</div>

					<%@ include file="../dbconn.jsp"%>
					<div class="col" align="left">
						<%
						String sql = "select * from posts order by p_category";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						String str = null;
						String category = null;
						String title = null;
						String id = null;
						while (rs.next()) {
						%>
						<div class="post-wrap categories">
							<div class="categories-card">

								<div class="card-item">
									<%
									if (category == null) {
										category = rs.getString("p_category");
									%>
									<div class="categories">
										<a href="/MyBlog/posts/categoryPost.jsp?category=<%=rs.getString("p_category")%>">
											<h3>
												<i class="iconfont icon-category" style="padding-right: 3px"></i>
												<%=category%>
											</h3>
										</a>
										<article class="archive-item">
											<a class="archive-item-link" href="/MyBlog/posts/post.jsp?id=<%=rs.getInt("p_id")%>"><%=rs.getString("p_title")%></a>
										</article>
										<%
										} else if (!rs.getString("p_category").equals(category)) {
										category = rs.getString("p_category");
										%>
									</div>
								
								<div class="categories">
									<a href="/MyBlog/posts/categoryPost.jsp?category=<%=rs.getString("p_category")%>">
										<h3>
											<i class="iconfont icon-category" style="padding-right: 3px"></i>
											<%=category%>
										</h3>
									</a>
									<article class="archive-item">
											<a class="archive-item-link" href="/MyBlog/posts/post.jsp?id=<%=rs.getInt("p_id")%>"><%=rs.getString("p_title")%></a>
										</article>
									<%
									} else {
										category = rs.getString("p_category");
									%>
									<article class="archive-item">
										<a class="archive-item-link" href="/MyBlog/posts/post.jsp?id=<%=rs.getInt("p_id")%>"><%=rs.getString("p_title")%></a>
									</article>
									<%
									}
									%>
						<%
						title = rs.getString("p_title");
						id = rs.getString("p_id");
						}
						if (rs != null)
						rs.close();
						if (pstmt != null)
						pstmt.close();
						if (conn != null)
						conn.close();
						%>
						<%-- <article class="archive-item">
							<a class="archive-item-link" href="/MyBlog/posts/post.jsp?id=<%=id%>"><%=title %></a>
						</article> --%>
					</div>
				</div>
			</div>
			</div>
			<%@ include file="../footer.jsp"%>
		</div>
		</div>
	</fmt:bundle>
</body>

</html>
