<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="doctorBean" class="hospital.member.DoctorBean"/>
<jsp:setProperty property="*" name="doctorBean"/>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>
<%
String id = (String)session.getAttribute("doctorKey");
boolean b = doctorMgr.doctorUpdate(doctorBean,id);
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
	alert("의사정보 수정이 완료되었습니다");
	location.href="../doctor/doc_index.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("의사정보 수정에 실패했습니다.\n관리자에게 문의 바랍니다.");
	location.href="docupdate.jsp";
</script>
<%
}
%>
</body>
</html>