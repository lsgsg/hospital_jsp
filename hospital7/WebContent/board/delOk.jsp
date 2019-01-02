<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" scope="page"/>
<%
String spage = request.getParameter("page");
String num = request.getParameter("num");
String pass = request.getParameter("pass");
//System.out.println(bean.getNum() + " " + bean.getPass());
boolean b = qnaMgr.checkPass(Integer.parseInt(num), pass);	//비밀번호 맞는지 확인하기 위해
if(b){
	qnaMgr.delData(num);	//num만 들고가
	response.sendRedirect("qnalist.jsp?page=" + spage);
}else{
%>
	<script>
	alert("비밀번호 불일치");
	history.back();
	</script>
<%	
}
%>