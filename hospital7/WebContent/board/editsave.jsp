<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="hospital.qna.QnaBean" scope="page"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" scope="page"/>
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");	//page는 boardBean에 안들어있어
//System.out.println(bean.getNum() + " " + bean.getPass());
boolean b = qnaMgr.checkPass(bean.getNum(), bean.getPass());	//비밀번호 맞는지 확인하기 위해
if(b){
	qnaMgr.editData(bean);	//bean들고가
	response.sendRedirect("qnacontent.jsp?num=" + num + "&page=" + spage);
}else{
%>
	<script>
	alert("비밀번호 불일치");
	history.back();
	</script>

<%	
}
%>