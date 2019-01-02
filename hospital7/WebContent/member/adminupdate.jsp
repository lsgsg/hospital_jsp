<%@page import="hospital.member.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="adminMgr" class="hospital.member.AdminManager"/>
<%
String id = (String)session.getAttribute("adminKey");

AdminBean bean = adminMgr.getAdmin(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사정보 수정</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnSubmit").onclick = inputCheck2;
}

</script>
</head>
<body class="admin_top_body">
<%@ include file="../admin/admin_top.jsp" %>
 <div class="section">
    	<form name="regForm" method="post" action="adminupdateproc.jsp" class="registerform">
          <h2 style="color:#ffffff;opacity:0.5;"> 회원 정보수정 </h2>
    			<table style="background-color:#ffffff;">
    				<tr>
    					<td>아이디</td>
    					<td><input type="text" name="id" value="<%=bean.getId() %>" style="width: 90%;background-color:#eeeeee;" readonly="readonly"></td>
    				</tr>
    				<tr>
    					<td>패스워드</td>
    					<td><input type="password" name="passwd"></td>
    				</tr>
    				<tr>
    					<td>패스워드 확인</td>
    					<td><input type="password" name="repasswd"></td>
    				</tr>
    				<tr>
    					<td>이름</td>
    					<td><input type="text" name="name" value="<%=bean.getName() %>"></td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<input type="button"
    						value="정보수정" id="btnSubmit" class="registerbtn regibtn1">
    						&nbsp;&nbsp;&nbsp;&nbsp;
    						<input type="reset" value="다시쓰기" class="registerbtn regibtn2">
    					</td>
    				</tr>
    			</table>
    		</form>
  </div>
</body>
</html>