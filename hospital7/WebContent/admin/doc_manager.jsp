<%@page import="hospital.yeyak.DocscBean"%>
<%@page import="hospital.yeyak.YeyakBean"%>
<%@page import="hospital.member.PatientBean"%>
<%@page import="hospital.member.PatientBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager" />
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager" />
<jsp:useBean id="docscMgr" class="hospital.yeyak.DocscManager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사-예약관리</title>
</head>
<body class="admin_top_body">
<%@ include file="../admin/admin_top.jsp" %>
<div class="tblcover">
	<div class="admintbl1">
<h2>* 수납관리 *</h2> 
			<table style="width: 100%" border="1">
				<tr>
					<th>번호</th>
					<th>의과번호</th>
					<th>환자ID</th>
					<th>의사ID</th>
					<th>예약번호</th>
					<th>상세정보</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>예약정보</th>
		
				</tr>
				<%
					ArrayList<YeyakBean> list = yeyakMgr.getYeyakAll();
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="7">예약내역이 없습니다</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							YeyakBean yeyak = (YeyakBean) list.get(i);
							DocscBean docsc = docscMgr.getDocSchedule(Integer.toString(yeyak.getSc_no()));
							PatientBean patient = patientMgr.getMember(yeyak.getPat_id());
				%>
				<tr>
					<td><%=yeyak.getNo()%></td>
					<td><%=yeyak.getDept_no()%></td>
					<td><%=yeyak.getPat_id()%></td>
					<td><%=yeyak.getDoc_id()%></td>
					<td><%=docsc.getDate()%></td>
					<td><%=docsc.getTime()%></td>
					<td><%=yeyak.getDetail()%></td>
					<td><%=patient.getName()%></td>
					<td><%=patient.getAge()%></td>
					<td><%=patient.getGen()%></td>
					<%
						if (yeyak.getState().equals("4")) {
					%>
		
					<td>
					<form action="doc_yeyakdetail.jsp" name=detailFrm method="post">
					<input type="hidden" name="no" value="<%=yeyak.getNo()%>"> 
					<input type="submit" value="진료완료 (수납처리 대기)">
					</form>
					</td>
		
					<%
						} else {
					%>
					<td>
					<%
					switch(Integer.parseInt(yeyak.getState())){
					case 1 : out.println("진료수속중"); break;
					case 2 : out.println("진료수속중"); break; 
					case 3 : out.println("진료수속중"); break;
					case 4 : out.println("진료완료"); break;
					case 5 : out.println("<a style='color:red'>결제완료</a>"); break;
					default : out.println("Question"); break;		
					}
					%>
					</td>
					<%
					}
					%>
		
				</tr>
				<%
					}
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>