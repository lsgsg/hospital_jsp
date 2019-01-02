<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" scope="page"/>
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
String pass = request.getParameter("pass");

boolean b = qnaMgr.checkPass(Integer.parseInt(num), pass);
if(b){
	qnaMgr.delData(num);  
	response.sendRedirect("qnalist.jsp?page=" + spage);
}else{
%>
	<script>
	alert("비밀번호 불일치!!!");
	history.back();
	</script>
<%
}
%>
