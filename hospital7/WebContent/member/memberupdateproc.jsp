<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="patientBean" class="hospital.member.PatientBean"/>
<jsp:setProperty property="*" name="patientBean"/>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<% 
boolean b = patientMgr.memberUpdate(patientBean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
%>
<script type="text/javascript">
	alert("회원정보 수정이 완료되었습니다");
	location.href="../patient/patient_index.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("회원정보 수정에 실패했습니다.\n관리자에게 문의 바랍니다.");
	location.href="../patient/patient_index.jsp";
</script>
<%
}
%>
</body>
</html>