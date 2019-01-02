<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="patientBean" class="hospital.member.PatientBean"/>
<jsp:setProperty property="*" name="patientBean"/>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
boolean b = patientMgr.memberInsert(patientBean);

if(b){
%>
<script type="text/javascript">
	alert("가입해주셔서 감사합니다.\n로그인해주시길 바랍니다");
	location.href="../patient/patient_index.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("회원 가입에 실패했습니다.\n관리자에게 문의 바랍니다.");
	location.href="../patient/patient_index.jsp";
</script>
<%
}
%>
</body>
</html>