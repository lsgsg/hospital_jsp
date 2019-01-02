<%@page import="java.util.ArrayList"%>
<%@page import="hospital.yeyak.YeyakdisplayBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager"/>
<jsp:useBean id="bean" class="hospital.yeyak.YeyakdisplayBean"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
</head>
<body class="yeyaklist_body">
<%@ include file="patient_top.jsp" %>
	<div class="section">
		<h2> 예약 내역 확인 </h2>
		<table style="width: 62.5vw">
			<tr>
				<th>예약번호</th><th>담당의사이름</th><th>의사과</th><th>예상방문일</th><th>예약시간</th><th>예약상태</th>
			</tr>
			<% 
			String id = (String)session.getAttribute("patientKey");
			
			ArrayList<YeyakdisplayBean> list = yeyakMgr.getYeyak(id);
			
			for(YeyakdisplayBean yd:list){
				
			%>
				<tr>
					<td><a href="patyeyakinfo.jsp?num=<%=yd.getYeyak_no() %>"><%= yd.getYeyak_no() %></a></td>
					<td><a href="patyeyakinfo.jsp?num=<%=yd.getYeyak_no() %>"><%= yd.getDoctor_name() %></a></td>
					<td><a href="patyeyakinfo.jsp?num=<%=yd.getYeyak_no() %>"><%= yd.getHos_dept_name() %></a></td>
					<td><a href="patyeyakinfo.jsp?num=<%=yd.getYeyak_no() %>"><%= yd.getDoc_sc_date() %></a></td>
				<td><a href="patyeyakinfo.jsp?num=<%=yd.getYeyak_no() %>"><%= yd.getDoc_sc_time() %></a></td>
				<td><a href="patyeyakinfo.jsp?num=<%= yd.getYeyak_no() %>">
				<%
				switch(Integer.parseInt(yd.getYeyak_state())){
				case 1: out.println("예약완료"); break;
				case 2: out.println("예약취소"); break;
				case 3: out.println("예약수정완료"); break;
				case 4: out.println("진료완료"); break;
				case 5: out.println("결제완료"); break;
				default: out.println("예약중");
				}
				%></a>
				</td>	
			</tr>
			<%
			}
			%>
		</table>
	</div>

<%@ include file="patient_bottom.jsp" %>
</body>
</html>