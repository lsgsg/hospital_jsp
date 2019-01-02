<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>
<jsp:useBean id="adminMgr" class="hospital.member.HosAdminManager"/>

<%
//세션 값이 있을 때와 없을 때 다른 페이지 보여주기.
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String sel = request.getParameter("sel");

//환자 로그인
if(sel.equals("환자")){
	boolean b = patientMgr.loginCheck(id, passwd);
	if(b){ 
		session.setAttribute("patientKey", id);
		response.sendRedirect("../patient/patient_index.jsp");
	}else{
		%>
		<script>
		alert("환자 로그인 실패!");
		location.href = "../patient/patient_index.jsp";
		</script>
		<%
	}

//의사 로그인
}else if(sel.equals("의사")){
	boolean b = doctorMgr.doctorLoginChk(id, passwd);
	if(b){ 
		session.setAttribute("doctorKey", id);
		response.sendRedirect("../doctor/doc_index.jsp");
	}else{
		%>
		<script>
		alert("의사 로그인 할 수 없거나 승인 요청 중");
		location.href = "../index.jsp";
		</script>
		<%
	}

//관리자 로그인
}else if(sel.equals("관리자")){
	boolean b = adminMgr.hosAdminLoginChk(id, passwd);
	if(b){
		session.setAttribute("adminKey", id);
		response.sendRedirect("../admin/admin_index.jsp");
	}else{
	%>
	<script>
		alert("관리자 입력자료 불일치");
		location.href="login.jsp?sel=admin";
	</script>
<%
	}
}
%>
		