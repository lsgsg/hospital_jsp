<%@page import="hospital.yeyak.DocscBean"%>
<%@page import="hospital.yeyak.HosDeptBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="docscMgr" class="hospital.yeyak.DocscManager"/>
<jsp:useBean id="hosdeptMgr" class="hospital.yeyak.HosDeptManager"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사별 스케줄</title>
</head>
<body class="admin_top_body">
<%@ include file="../admin/admin_top.jsp" %>
<div class="tblcover">
	<div class="admintbl1">
<h2>* 진료현황 *</h2> 
			<table style="text-align: center; width:100%" >
				<tr style="background-color: cyan">
					<th>번호</th><th>아이디</th><th>날짜</th><th>예약시간</th><th>예약여부</th><th>의과명</th><th>의과번호</th>
				</tr>
				<%
				ArrayList<DocscBean> list = docscMgr.getDoctordeptAll();
				/* ArrayList<HosDeptBean> list2 = hosdeptMgr.getHosDeptAll(); */
				for(DocscBean m:list){
				%>
				<tr>
					<td><%=m.getNo() %></td><td><%=m.getDoc_id() %></td><td><%=m.getDate() %></td>
					<td><%=m.getTime() %></td><td><%=m.getState() %></td> 
					<td><%=m.getBusername() %></td> <td><%=m.getBusernum() %></td>
					
					
				</tr>
				<%	
				}
				%>
				
				
				
				
			</table>
		</div>
	</div>


</body>
</html>