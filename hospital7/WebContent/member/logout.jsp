<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("patientKey")!=null){
	session.removeAttribute("patientKey");	
}else if(session.getAttribute("adminKey")!=null){
	session.removeAttribute("adminKey");	
}else if(session.getAttribute("doctorKey")!=null){
	session.removeAttribute("doctorKey");	
}
%>
<script type="text/javascript">
	alert("로그아웃 성공");
	//location.href = "login.jsp";
	location.href = "../index.jsp";
</script>
</body>
</html>