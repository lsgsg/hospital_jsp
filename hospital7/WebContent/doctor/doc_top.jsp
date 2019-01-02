<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String docId = (String)session.getAttribute("doctorKey");
String log,doc;

if(docId == null){
	docId = "";
	response.sendRedirect("../member/login.jsp?sel=doctor");
	log = "";
	doc = "";
}else{
	log = "<a href='../member/logout.jsp'>로그아웃</a>";
	doc = "<a href='../member/docupdate.jsp'>정보수정</a>";
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://idangero.us/swiper/dist/css/swiper.min.css'>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js'></script>
<script>
$(document).ready(function(e){
	$(".docmenuclick").click(function(){
		$(".docmenu").css("width","25vw");	
	})
	$(".menubtn").click(function(){
		$(".docmenu").css("width","0");	
	})
})
</script>
</head>
<body>


<div class="docmenuclick">
	<span>
		<img src="../images/doc_menu.png" alt="메뉴버튼">
	</span>

</div>
<div class="docmenu">
	<button class="menubtn"><img src="../images/close.png" alt="닫기버튼"></button>
	<ul>
		<li></li>
		<li><a href="../patient/patient_index.jsp">환자 예약 홈 바로가기</a></li>
		<li><a href="doc_index.jsp">의사홈 바로가기</a></li>
		<li><a href="../admin/admin_index.jsp">관리자홈 바로가기</a></li>
		<li><a href="docyeyakinfo.jsp">예약확인</a></li>
		<li></li>
	</ul>
</div>
<div class="login2">
	<%=doc%>
	<%=log%>
	<a href='#'><%=docId%></a>
</div>

</body>
</html>