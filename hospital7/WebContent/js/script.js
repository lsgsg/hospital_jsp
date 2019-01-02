function zipCheck(){
	url = "zipcheck.jsp?check=y"; //우편번호 찾기 화면. 첨엔 안된 상태(check=y). 
	//뒤에는 찾기 이루어진 상태(check=n)
	window.open(url, "", "toolbar=no, width=500, height=300, " +
			"top=200, left=300, scrollbar=yes, menubar=no");
}

function zipCheck2(){
	url = "../member/zipcheck.jsp?check=y"; //우편번호 찾기 화면. 첨엔 안된 상태(check=y). 
	//뒤에는 찾기 이루어진 상태(check=n)
	window.open(url, "", "toolbar=no, width=500, height=300, " +
			"top=200, left=300, scrollbar=yes, menubar=no");
}

function idCheck(){
	if(regForm.id.value === ""){
		alert("ID를 입력하세요");
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "", "toolbar=no, width=300, height=150, " +
		"top=200, left=300, scrollbar=yes, menubar=no");
	}
}

function docidCheck(){
	if(docregform.id.value === ""){
		alert("ID를 입력하세요");
		docregform.id.focus();
	}else{
		url = "docidcheck.jsp?id=" + docregform.id.value;
		window.open(url, "", "toolbar=no, width=300, height=150, " +
		"top=200, left=300, scrollbar=yes, menubar=no");
	}
}

function inputCheck(){
	//입력자료 오류검사
	if(regForm.id.value === ""){
		alert("ID를 입력하세요");
		regForm.id.focus();
		return;
	}
	
	if(regForm.passwd.value === ""){
		alert("비밀번호를 입력하세요");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.passwd.value !== regForm.repasswd.value){
		alert("비밀번호 입력 오류!!\n확인하세요");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.job.value === "0"){
		alert("직업을 선택하세요");
		regForm.job.focus();
		return;
	}
	
	//나머진 생략
	regForm.submit();
}

////////////////////////////////////
//쇼핑몰 로그인 후 자신의 정보 수정시 사용
function memUpdateFunc(){
	//입력자료 검사는 생략
	regForm.submit();
}

function memUpdateCancelFunc(){
	location.href = "../guest/guest_index.jsp";
}

function memDelete(){
	alert("회원 탈퇴 불가!!!");
}

//관리자가 회원수정
function memUpdate(id){
	document.updateFrm.id.value = id;
	document.updateFrm.submit();	
}

function zipCheckAdmin(){
	url = "../member/zipcheck.jsp?check=y"; //우편번호 찾기 화면. 첨엔 안된 상태(check=y). 
	//뒤에는 찾기 이루어진 상태(check=n)
	window.open(url, "", "toolbar=no, width=500, height=300, " +
			"top=200, left=300, scrollbar=yes, menubar=no");
}

function memUpdateAdminFunc(){
	//입력자료 검사는 생략
	document.updateFormAdmin.submit();
}

function memUpdateCancelAdminFunc(){
	location.href = "membermanager.jsp";
}

function productDetail(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function productUpdate(no){
	updateFrm.no.value = no;
	updateFrm.submit();
}

function productDelete(no){
	if(confirm("정말 삭제할까요?")){
		delFrm.no.value = no;
		delFrm.submit();		
	}
}

//장바구니 처리용 함수 2개(guest/cartlist.jsp) ->flag, product_no, quantity를 받음
function cartUpdate(form){
	form.flag.value = "update";
	form.submit();
}

function cartDelete(form){
	form.flag.value = "del";
	form.submit();
}

function orderDetail(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

/*---------Written by Luke-------------*/

function yeyakUpdate(form){ 
	yeyakDetailFrm.flag.value = "update";
	yeyakDetailFrm.submit();
}

function yeyakDelete(form){ 
	yeyakDetailFrm.flag.value = "delete";
	yeyakDetailFrm.submit();
}


//관리자 예약에서 상세보기
function yeyakDetail(no) {
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function yeyakDetail(form) {
	//document.orderDetailFrm.flag.value = "update"; 가능(아래와 동일)
	form.flag.value = "update";
	form.submit();
}

/*---------Written by Luke-------------*/

//관리자가 회원수정하러가기
function memUpdate(id) {
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

//관리자가 회원정보수정하기
function memUpdateAdminFunc() {
	document.updateFormAdmin.submit();
}
//관리자가 회원정보수정취소하기
function memUpdateCancelAdminFunc() {
	location.href="membermanager.jsp";
}


//의사 정보수정 페이지에서 사용. 2018-09-27 김태홍
function inputCheck2(){
	//입력자료 오류검사
	if(regForm.id.value === ""){
		alert("ID를 입력하세요");
		regForm.id.focus();
		return;
	}
	if(regForm.passwd.value === ""){
		alert("비밀번호를 입력하세요");
		regForm.passwd.focus();
		return;
	}
	if(regForm.passwd.value !== regForm.repasswd.value){
		alert("비밀번호 입력 오류!!\n확인하세요");
		regForm.passwd.focus();
		return;
	}
	regForm.submit();
}