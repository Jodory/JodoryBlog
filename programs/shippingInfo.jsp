<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 완료 -->
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>배송 정보</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">배송 정보</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			</div>
			<form action="./processShippingInfo.jsp" class="form-horizontal"
				method="post">
				<input type="hidden" name="cartId"
					value="<%=request.getParameter("cartId")%>" />
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-3">
						<input name="shippingDate" type="text" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="country" type="text" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">거래은행</label>
					<div class="col-sm-3">
						<input name="zipCode" type="text" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">계좌번호</label>
					<div class="col-sm-5">
						<input name="addressName" type="text" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
							class="btn btn-secondary" role="button"> 이전 </a> <input
							type="submit" class="btn btn-primary" value="등록" /> <a
							href="./checkOutCancelled.jsp" class="btn btn-secondary"
							role="button"> 취소 </a>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>
