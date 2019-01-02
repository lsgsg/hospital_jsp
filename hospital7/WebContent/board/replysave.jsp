<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="hospital.qna.QnaBean" scope="page"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" scope="page"/>
<%
String spage = request.getParameter("page");	//page는 boardBean에 안들어있어
int num = bean.getNum();
int gnum = bean.getGnum();
int onum = bean.getOnum() + 1;
int nested = bean.getNested() + 1;

//같은 그룹 내에서 새로운 댓글의 onum보다 크거나 같은 값을 댓글 입력 전에 먼저 수정하기. 작으면 수정 안함
qnaMgr.updateOnum(gnum, onum);	//onum 갱신
//onum, nested 는 하나씩 추가된 값을 넣어줌
bean.setOnum(onum);
bean.setNested(nested);
bean.setBip(request.getRemoteAddr());
bean.setBdate();
bean.setNum(qnaMgr.currentGetMaxNum() + 1);

qnaMgr.saveReplyData(bean);
response.sendRedirect("qnalist.jsp?page=" + spage);	//해당 페이지로 돌아감

%>