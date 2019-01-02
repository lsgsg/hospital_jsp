<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>

<%
String id = request.getParameter("id");
boolean b = doctorMgr.doctorOkUpdate(id);

if(b){
%>	
	<script type="text/javascript">
		alert("가입성공");
		location.href="docapproval.jsp";
	</script>
<%}else{%>
	<script type="text/javascript">
		alert("가입실패\n관리자에게 문의바람");
		history.back();
	</script>
<%
}
%>
</body>
</html>