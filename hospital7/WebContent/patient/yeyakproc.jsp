<%@page import="hospital.member.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager"/>
<jsp:useBean id="docscMgr" class="hospital.yeyak.DocscManager"/>
<%
request.setCharacterEncoding("utf-8");

//doc_sc 업데이트
String doc_id = request.getParameter("doc_id");
String date = request.getParameter("date");
String time = request.getParameter("time");
String pat_id = (String)session.getAttribute("patientKey");
//System.out.println(doc_id + " " + date + " " + time + " " + pat_id);
boolean b_sc = docscMgr.confirmSchedule(doc_id, date, time);

//yeyak 업데이트
String detail = request.getParameter("detail");
//System.out.println(detail);
DoctorBean bean = doctorMgr.getDoctorId(doc_id); //해당 id 의사의 dept_no 얻기
int dept_no = bean.getDept_no();
int sc_no = docscMgr.getDocScNo(date, time); 

boolean b_yeyak = yeyakMgr.insertYeyak(dept_no, pat_id, doc_id, sc_no, detail);
System.out.println(b_yeyak);

if(b_sc & b_yeyak){
%>
	<script>
	alert("예약 성공");
	location.href = "yeyaklist.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("예약 실패. 관리자 문의");
	location.href = "yeyak.jsp";
	</script>
<%
}

%>
