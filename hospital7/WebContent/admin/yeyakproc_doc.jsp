<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager"/>

<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");

boolean b = false;
if(flag.equals("update")){
	b = yeyakMgr.updateYeyak(no, state);
}else if(flag.equals("delete")){
	b = yeyakMgr.deleteYeyak(no);
}else{
	response.sendRedirect("doc_manager.jsp");
}

if(b){
%>
	<script>
	alert("정상처리되었음");
	location.href="doc_manager.jsp";
	</script>
<%	
}else{
%>
	<script>
	alert("오류발생\n관리자에게 문의 바람");
	location.href="doc_manager.jsp";
	</script>
<%
}
%>