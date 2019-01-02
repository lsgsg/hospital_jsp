<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="adminBean" class="hospital.member.AdminBean"/>
<jsp:setProperty property="*" name="adminBean"/>
<jsp:useBean id="adminMgr" class="hospital.member.AdminManager"/>
<%
String id = (String)session.getAttribute("adminKey");
boolean b = adminMgr.adminUpdate(adminBean,id);
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
	alert("관리자정보 수정이 완료되었습니다");
	location.href="../admin/admin_index.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("관리자정보 수정에 실패했습니다.\n관리자에게 문의 바랍니다.");
	location.href="adminupdate.jsp";
</script>
<%
}
%>
</body>
</html>