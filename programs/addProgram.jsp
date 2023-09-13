<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type = "text/javascript" src = "../resources/js/addProgramsValidation.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>프로그램 등록</title>
</head>
<body>

	<fmt:setLocale value='<%=request.getParameter("language")%>' />

	<fmt:bundle basename="bundle.message">
		<%@ include file="../header.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="title" />
				</h1>
			</div>
		</div>

		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
				<br> <br> <a href="logout.jsp"
					class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<form name="newProgram" action="/MyBlog/processAddProgram.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="programId" /></label>
					<div class="col-sm-3">
						<input type="text" name="programId" id="programId"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="name" /></label>
					<div class="col-sm-3">
						<input type="text" name="name" id="name" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
					<div class="col-sm-3">
						<input type="text" name="unitPrice" id="unitPrice"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="producer" /></label>
					<div class="col-sm-3">
						<input type="text" name="producer" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
					<div class="col-sm-3">
						<input type="text" name="releaseDate" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="updateDate" /></label>
					<div class="col-sm-3">
						<input type="text" name="recentUpdate" class="form-control" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="content" /></label>
					<div class="col">
						<textarea name="editordata" id="summernote"></textarea>
						<script>
							$(document).ready(function() {
								$("#summernote").summernote({
									height : 350
								});
							});
						</script>
					</div>
				</div> 

				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="programImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="programImage" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary" value="<fmt:message key = "button"/>" onclick = "CheckAddPrograms()"/>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>

</body>
</html>