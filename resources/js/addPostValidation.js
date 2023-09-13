

function CheckAddPost() {

	
	var name = document.getElementById("title");
	
	
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}

	//form.submit();
	document.newPost.submit();
}
