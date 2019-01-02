<%@page import="hospital.yeyak.YeyakdisplayBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hospital.yeyak.YeyakManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager"/>
<jsp:useBean id="bean" class="hospital.yeyak.YeyakdisplayBean"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	$(".oksc").click(function(){
		$(".caltbl").show("display","block");
	})
})

function cancel(){
	alert("관리자에게 문의");
	location.href = "yeyaklist.jsp";
}
</script>
</head>
<body class="patYeyakinfo_body">
<%@ include file="patient_top.jsp" %>
<div class="session">
		<div class="prescription">
				<ul class="prescription_ok">
					<li> <span> 예약 조회 </span></li>
					<%
					String id = (String)session.getAttribute("patientKey");
					String num = request.getParameter("num");
					//String id = "abc";
					YeyakdisplayBean yd = yeyakMgr.getYeyakDetail(id, num);
					//System.out.println(yd.getYeyak_no());
					//if(list.size() == 0){
						%>
						<!-- <tr><td colspan="8">예약한 내역이 없습니다</td></tr> -->
						<% 
						//}else{
					
						//System.out.println(yd.getYeyak_no());
					
					%>
					<li>
						<p> 예약번호 <span><%= yd.getYeyak_no() %></span></p>
						<p> 담당의사이름 <span><%= yd.getDoctor_name() %></span></p>
						<p> 의사과 <span><%= yd.getHos_dept_name() %></span></p>
					</li>
					<li>
						<p> 예상방문일 <span><%= yd.getDoc_sc_date() %></span></p>
						<p> 예약시간 <span><%= yd.getDoc_sc_time() %></span></p>
						<p> 예약상태  <span><%= yd.getYeyak_state() %></span></p>
					</li>
					<li>
						<p>
							자가진단&nbsp;&nbsp;&nbsp;&nbsp;
							<span><%= yd.getDetail() %></span>
						</p>
					</li>
			 </ul>
			 <p>금액 : <span> <%= yd.getYeyak_cost() %> 원 </span>
			 <a href="javascript:cancel()">예약취소</a><a href="yeyak.jsp">예약수정</a>
			 <a href="yeyaklist.jsp">목록으로</a></p>
		</div>
</div>
					<%
					
					%>
<%@ include file="patient_bottom.jsp" %>
</body>
</html>