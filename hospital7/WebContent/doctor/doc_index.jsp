<%@page import="java.util.ArrayList"%>
<%@page import="hospital.member.DoctorBean"%>
<%@page import="hospital.yeyak.HosDeptBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager" />
<jsp:useBean id="hosDeptMgr" class="hospital.yeyak.HosDeptManager"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="doc_top.jsp" %>
	<div class="docsession">
	<%
	ArrayList<DoctorBean> logDoclist = doctorMgr.getDocIdsel(docId); 
	for(DoctorBean bean:logDoclist){
	%>
	
		<a href="../member/docupdate.jsp" class="docimg"><img src="../images/<%=bean.getImage() %>" alt="의사로그인이미지"></a>
		<%
		String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
		%>
		<p><%=dept_name %> 의사</p>
		<h1><%=bean.getName() %> 로그인</h1>
		<a href="docyeyakinfo.jsp" class="aconfirm">예약환자 확인</a>
		<a href="docscinsert.jsp" class="aconfirm">스케줄 입력</a>
		
		
	<%
	}
	%>
						
	
	
	
</div>
</body>
</html>