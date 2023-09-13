<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Program"%>
<%@ page import="dao.ProgramRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
// 완료
String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">장바구니</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left"><a
							href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a
							href="./shippingInfo.jsp?cartId=<%=cartId%>"
							class="btn btn-success">주문하기</a></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
					<%
					int sum = 0;
					ArrayList<Program> cartList = (ArrayList<Program>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Program>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Program program = cartList.get(i);
						int total = program.getUnitPrice() * program.getQuantity();
						sum = sum + total;
					%>
					<tr>
						<td><%=program.getProgramId()%> - <%=program.getName()%></td>
						<td><%=program.getUnitPrice()%></td>
						<td><%=program.getQuantity()%></td>
						<td><%=total%></td>
						<td><a href="./removeCart.jsp?id=<%=program.getProgramId()%>"
							class="badge badge-danger">삭제</a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum%></th>
						<th></th>
					</tr>
				</table>
				<a href="./programs.jsp" class="btn btn-secondary"> &laquo; 쇼핑
					계속하기</a>
			</div>
			<hr>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>
