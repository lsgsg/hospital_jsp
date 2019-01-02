<%@page import="hospital.yeyak.DocscBean"%>
<%@page import="hospital.yeyak.YeyakBean"%>
<%@page import="hospital.member.PatientBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.YeyakManager"/>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<jsp:useBean id="docscMgr" class="hospital.yeyak.DocscManager"/>

<%
String no = request.getParameter("no");
YeyakBean yeyak = yeyakMgr.getYeyakDetail(no);
DocscBean docsc = docscMgr.getDocSchedule(Integer.toString(yeyak.getSc_no()));
PatientBean patient = patientMgr.getMember(yeyak.getPat_id());
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body class="admin_top_body">
<%@ include file="../admin/admin_top.jsp" %>
<div class="tblcover">
	<div class="admintbl1">
				<h2>* 예약 상세보기 * </h2>
			<form action="yeyakproc_admin.jsp" name="yeyakDetailFrm" method="post">
			
				<table style="width: 100%" border="1">
					<tr>
						<td>번호	: <%=yeyak.getNo()%></td>
						<td>환자ID	: <%=yeyak.getPat_id()%></td>
						<td>의과번호	: <%=yeyak.getDept_no()%></td>
			
					</tr>
					<tr>
						
						<td>예약된 날짜	: <%=docsc.getDate()%></td>
						<td>예약된 시간	: <%=docsc.getTime()%></td>
						<td>상세정보	: <%=yeyak.getDetail()%></td>
						
					</tr>
					<tr>
			 			<td>이름	: <%=patient.getName()%></td>
						<td>나이	: <%=patient.getAge()%></td>
						<td>성별	: <%=patient.getGen()%></td> 
					</tr>
					
					<tr>
						<td>의사ID : <%=yeyak.getDoc_id()%></td>
						<td>상태 : 
						<%
						switch(Integer.parseInt(yeyak.getState())){
						case 1 : out.println("예약완료"); break;
						case 2 : out.println("예약취소"); break; 
						case 3 : out.println("예약수정완료"); break;
						case 4 : out.println("진료완료"); break;
						case 5 : out.println("결제완료"); break;
						default : out.println("Question"); break;		
						}
						%>
						</td>	
						<td>총 금액 : 
						<%=yeyak.getCost() %>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							예약 상태 : 
							<select name="state">
							<option value="4">진료완료</option>
							<option value="5">결제완료</option>				
							</select>
							<script type="text/javascript">
							document.yeyakDetailFrm.state.value = "<%=yeyak.getState()%>";
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							<input type="button" value="수정" onclick="yeyakUpdate(this.form)"> 
							<input type="button" value="삭제" onclick="yeyakDelete(this.form)">
							<input type="hidden" name="no" value="<%=yeyak.getNo()%>">
							<input type="hidden" name="flag">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>