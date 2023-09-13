<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
	//완료
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode ="";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	%>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">주문 완료</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.<br>
			<%=shipping_zipCode%> : 938002-05-957535<br>
			위 가상 계좌로 24시간 내에 해당 금액을 입금해주시기 바랍니다.</h2>
			<p>
				해당 프로그램은 입금 확인 후 1일 내 배송될 예정입니다! !
			<p>
				주문번호 :
				<%
			out.println(shipping_cartId);
			%>
			
		</div>
		<div class="container">
			<p>
				<a href="./programs.jsp" class="btn btn-secondary"> &laquo; 상품
					목록</a>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>
<%
session.invalidate();

for (int i = 0; i < cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if (n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);

	response.addCookie(thisCookie);
}
%>
