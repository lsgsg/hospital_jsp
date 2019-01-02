<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> kic 관리자 페이지</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
  </head>
  <body class="admin_top_body">
  	<%@ include file="../admin/admin_top.jsp" %>
	
	
		<div class="profile2 block2"> <!-- PROFILE (MIDDLE-CONTAINER) -->
			<h1 class="user-name2"><%=adminId%></h1>
	
	       <div class="profile-picture2 big-profile-picture2 clear2">
	          <img src="../images/user.png" alt="관리자이미지">
	       </div>
	      
	       <div class="profile-description2">
	           <p class="scnd-font-color2">LOGIN</p>
	       </div>
	       <ul class="profile-options2 horizontal-list2">
	           <li><a class="comments2" href="docapproval.jsp"><p>가입승인</p></a></li>
	           <li><a class="views2" href="admin_manager.jsp"><p>접수내역</p></a></li>
	           <li><a class="likes2" href="docschedule.jsp"><p>의사별<br>스케줄보기</p></a></li>
	           <li><a class="doc2" href="doc_manager.jsp"><p>의사수납처리</p></a></li>
	       </ul>
	   </div>
  </body>
</html>
