<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jodory">
<meta name="subtitle" content="Blog">
<meta name="description" content="Jodory's Blog">
<title>Jodory's Blog</title>
<!-- <link rel="icon" href="/image/favicon.ico"> -->

<link rel="stylesheet" href="./resources/css/iconfont.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>

<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

		<fmt:bundle basename="bundle.message">
		<%@ include file="header.jsp"%>
		<div class="jumbotron" >
			<div class="container">

				<h1 class="display-3">
					<fmt:message key = "blogTitle"/>
				</h1>

				<div class="links">
					<h3>
					<a class="link-item" title="Instagram" target="_blank"
						href="https://www.instagram.com/jodory9524/"> <i
						class="iconfont icon-instagram"></i>

					</a> <a class="link-item" title="Facebook"
						href="https://www.facebook.com/profile.php?id=100002910172277">


						<i class="iconfont icon-facebook"></i>

					</a> <a class="link-item" title="Github" target="_blank" rel="noopener"
						href="https://github.com/jodory"> <i
						class="iconfont icon-github"></i>
					</a>
					<fmt:message key = "follow"/>
					</h3>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<div class="container">

				<h3>
					<fmt:message key = "welcome"/>
				</h3>
				<hr>
				<p><fmt:message key = "str1"/>
				<p><fmt:message key = "str2"/>
				<p><fmt:message key = "str3"/>
				<p><fmt:message key = "str4"/>
				<h3 id="info"
					style="margin-top: 30px; margin-right: 0px; margin-left: 0px; font-family: -apple-system, BlinkMacSystemFont,&amp; amp; amp; amp; amp; amp; amp; quot; Helvetica Neue&amp;amp; amp; amp; amp; amp; amp; quot; , Arial , &amp;amp; amp; amp; amp; amp; amp; quot; PingFang SC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Hiragino Sans GB&amp;amp; amp; amp; amp; amp; amp; quot; , STHeiti , &amp;amp; amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Microsoft JhengHei&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Source Han Sans SC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Noto Sans CJK SC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Source Han Sans CN&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Noto Sans SC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Source Han Sans TC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Noto Sans CJK TC&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; WenQuanYi Micro Hei&amp;amp; amp; amp; amp; amp; amp; quot; , SimSun , sans-serif; font-weight: 700; line-height: 1.4; color: rgb(64, 64, 64);">Info
					<img src="/MyBlog/resources/images/Cho.jpg" style="width: 25%; float: right;"  class="note-float-right">

					</h3>
				<ul
					style="margin-bottom: 40px; color: rgb(64, 64, 64); font-family: -apple-system, BlinkMacSystemFont,&amp; amp; amp; amp; amp; amp; quot; Helvetica Neue&amp;amp; amp; amp; amp; amp; quot; , Arial , &amp;amp; amp; amp; amp; amp; quot; PingFang SC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Hiragino Sans GB&amp;amp; amp; amp; amp; amp; quot; , STHeiti , &amp;amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Microsoft JhengHei&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Source Han Sans SC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Noto Sans CJK SC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Source Han Sans CN&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Noto Sans SC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Source Han Sans TC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; Noto Sans CJK TC&amp;amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; quot; WenQuanYi Micro Hei&amp;amp; amp; amp; amp; amp; quot; , SimSun , sans-serif; font-size: 16px;">
					<li><fmt:message key = "info1"/></li>
					<li><fmt:message key = "info2"/></li>
					<li><fmt:message key = "info3"/></li>
					<li><fmt:message key = "info4"/></li>
					<li><fmt:message key = "info5"/></li>
					<li><fmt:message key = "info6"/></li>
					<li><fmt:message key = "info7"/>
						<ul style="margin-bottom: 5px;">
							<li><fmt:message key = "info8"/></li>
							<li><fmt:message key = "info9"/></li>
						</ul>
					</li>
					<li><fmt:message key = "info10"/>
						<ul style="margin-bottom: 5px;">
							<li><fmt:message key = "info11"/></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</fmt:bundle>

	<%-- <main role="main">
		<div class="container">
			<div class="text-center">
				<h3>
					<%=tagline%>
				</h3>
			</div>
			<hr>
		</div>
		
		<div class="container">
			<div class="text-center">
				<p>
					<%@ include file = "summary.jsp" %>
				</p>
			</div>
			<hr>
		</div>
		
	</main> --%>



</body>

</html>