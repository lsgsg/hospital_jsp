<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String adminId = (String)session.getAttribute("adminKey");
String log,doc;
//세션값에 의해 메뉴가 바뀜
if(adminId == null){
	adminId = "";
	response.sendRedirect("../member/login.jsp?sel=admin");
	log = "";
	doc = "";
}else{
	log = "<a href='../member/logout.jsp' class='logatag'>로그아웃</a>";
	doc = "<a href='../member/docupdate.jsp'>정보수정</a>";
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script>
$(document).ready(function(e){
	$('.setbtn').click(function(){
		$('.setarea').css('height','100px');
	})
	
	$('.admclosebtn').click(function(){
		$('.setarea').css('height','0px');
	})
	
	$('.admclosebtn2').click(function(){
		$('.adminMarea').css('left','-25vw');
	})
	
	$('.admenubtn').click(function(){
		$('.adminMarea').css('left','0vw');
	})
});
</script>
</head>
<body>
	<div class="adminmenu">
		<span class="setbtn"> <img src="../images/setting.png" alt="셋팅버튼"> </span>
		<span class="admenubtn"> <img src="../images/menu.png" alt="메뉴버튼"> </span>
		
		<%=log%>
		<%=doc%>
		<a href="#"><%=adminId%></a>
	</div>
	<div class="adminMarea">
		<span class="admclosebtn2">
			<img src="../images/close.png" alt="닫기버튼">
		</span>	
			<ul>
				<li></li>
				<li><a href="../patient/patient_index.jsp">환자 예약 홈 바로가기</a></li>
				<li><a href="../doctor/doc_index.jsp">의사홈 바로가기</a></li>
				<li><a href="admin_index.jsp">관리자홈 바로가기</a></li>
				<li></li>
				<li></li>
			</ul>
		
		
	</div>
	<div class="setarea">
		<span class="admclosebtn">
			<img src="../images/close.png" alt="닫기버튼">
		</span>
		<ul>
		
			<li></li>
			<li><a href="docapproval.jsp"><p>가입승인</p></a></li> 
			<li><a href="admin_manager.jsp"><p>예약관리</p></a></li>
			<li><a href="docschedule.jsp"><p>진료스케줄</p></a></li>
			<li><a href="doc_manager.jsp"><p>수납관리</p></a></li>
			<li></li>
		
		</ul>
	</div>
</body>
</html>