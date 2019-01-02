<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="docBean" class="hospital.member.DoctorBean"/>
<jsp:setProperty property="*" name="docBean"/>
<jsp:useBean id="docMgr" class="hospital.member.DoctorManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
boolean b = docMgr.doctorInsert(docBean);

if(b){
%>
<script type="text/javascript">
	alert("관리자에게 승인요청을 하였습니다.\n 관리자의 승인완료 후 로그인하실 수 있습니다.");
	location.href="../member/login.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("승인요청에 실패했습니다.\n관리자에게 문의 바랍니다.");
	location.href="doc_register.jsp";
</script>
<%
}
%>
</body>
</html>