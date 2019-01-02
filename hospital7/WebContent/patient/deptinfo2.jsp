<%@page import="hospital.member.DoctorBean"%>
<%@page import="hospital.yeyak.HosDeptBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager" />
<%
	request.setCharacterEncoding("utf-8");
	String dept = request.getParameter("dept");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function deptChange(dept){
	if(dept === "all"){ 
		location.replace("deptinfo.jsp");
	}else{
		location.replace("deptinfo.jsp?dept=" + dept);		
	}
}

</script>
</head>
<body class="deptinfo">
	<%@ include file="patient_top.jsp" %>
	<div class="session">
		<div class="yeyakForm2">
			<ul class="yeyakFormul">
				<li>
				<select name="dept_no" onchange="deptChange(this.value)">
				<option value="all">전체</option>
						<%
						for (HosDeptBean bean:dlist) {
							if(bean.getName().equals(dept)){
						%>
								<option value="<%=bean.getName()%>" selected><%=bean.getName()%></option>
						<%
							}else{
						%>
								<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
						<%
							}
						}
						%>
				</select>
				</li>
				<li>
					<table class="introDoc">
					
					<%
					if(dept == null){
						ArrayList<DoctorBean> allDocList = doctorMgr.getDoctorAll();
						for(DoctorBean bean:allDocList){
						%>
						<tr>
							<td><img src="../images/doctor1.png" alt="의사사진"></td>
							<td class="crear"></td>
							<td>
							<%
							String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
							%>
							<%=dept_name %> 의사<br>
							성명 : <%=bean.getName() %><br>
							생년월일 : <%=bean.getBirth() %><br>
							이메일 : <%=bean.getEmail() %><br>
							성별 : <%=bean.getGen() %><br>
							연락처 : <%=bean.getPhone().substring(0, 3) + "-" + //이건 더 생각해보기(자르는것)d
							bean.getPhone().substring(3, 7) + "-" +
							bean.getPhone().substring(7, bean.getPhone().length())%><br>
							<input type="hidden" name="name" value="<%=bean.getName()%>">
							<input type="hidden" name="dept" value="<%=dept_name%>">
							<input type="submit" value="예약하기">
							</td>
						</tr>
						<%
						}
					}else{
						String dept_no = hosDeptMgr.getDeptno(dept);
						ArrayList<DoctorBean> doclist = doctorMgr.getDoctorDept(dept_no);
						for(DoctorBean bean:doclist){
						%>
						<tr>
							<td><img src="../images/doctor1.png" alt="의사사진"></td>
							<td class="crear"></td>
							<td>
							<%
							String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
							%>j
							<%=dept_name %> 의사<br>
							성명 : <%=bean.getName() %><br>
							생년월일 : <%=bean.getBirth() %><br>
							이메일 :  <%=bean.getEmail() %><br>
							성별 : <%=bean.getGen() %><br>
							연락처 : <%=bean.getPhone().substring(0, 3) + "-" +
							bean.getPhone().substring(3, 7) + "-" +
							bean.getPhone().substring(7, bean.getPhone().length())%><br>
							<form action="yeyak.jsp?dept=<%=dept_name %>" method="post">
							<input type="hidden" name="name" value="<%=bean.getName()%>">
							<input type="hidden" name="dept" value="<%=dept_name%>">
							<input type="submit" value="예약하기">
							</form>
							</td>
						</tr>
						<%
						}	
					}
					%>
					</table>
				</li>
			</ul>
		</div>
	</div>
	<%@ include file="../patient/patient_bottom.jsp"%>
</body>
</html>