<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="hospital.qna.QnaBean" scope="page"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" scope="page"/>

<%
bean.setBip(request.getRemoteAddr());	//ip
System.out.println(request.getRemoteAddr());
bean.setBdate();	//등록일
int maxNum = qnaMgr.currentGetMaxNum() + 1;
bean.setNum(maxNum);
bean.setGnum(maxNum);
qnaMgr.saveData(bean);	//id를 객체로 사용, bean 객체

response.sendRedirect("qnalist.jsp?page=1");
%>