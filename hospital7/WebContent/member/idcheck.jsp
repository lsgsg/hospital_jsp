<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
boolean b = patientMgr.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<p><span style="font-weight:bold;"><%=id %> </span>
<%
if(b){
%>
	는(은) 이미 사용 중인 id입니다.</p>
	<input type="button" onclick="opener.document.regForm.id.focus(); window.close()" value="닫기"/>
<%}else{%>
	는(은) 사용 가능한 id입니다.</p>
	<input type="button" onclick="opener.document.regForm.passwd.focus(); window.close()" value="닫기"/>
	
<%
}
%>
</body>
</html>