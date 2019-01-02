<%@page import="hospital.member.DoctorBean"%>
<%@page import="hospital.yeyak.HosDeptBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>
<jsp:useBean id="hosdeptMgr" class="hospital.yeyak.HosDeptManager"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Management</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body class="admin_top_body">
<%@ include file="../admin/admin_top.jsp" %>
<div class="tblcover">
	<div class="admintbl1">
	<!-- 	<tr>
			<th>사진</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>부서번호</th><th>생일</th>
			<th>성별</th><th>전화</th><th>우편번호</th><th>주소</th><th>이메일</th><th>가입승인</th>
			
	
		</tr> -->
		<h2> 의사 관리 페이지 </h2>
		<ul>
		<%
		ArrayList<DoctorBean> list = doctorMgr.getDoctorFalse();
		for(DoctorBean m:list){
		%>
			<li>
				<p><img src="../images/<%=m.getImage() %>" alt="의사사진"></p>
				<div class="p">
					<ul>
						<li>
							아이디 : <%=m.getId() %> <br>
							비밀번호 : <%=m.getPasswd() %> <br>
							이름 : <%=m.getName() %> <br>
							의사번호 : <%=m.getDept_no() %> <br>
							생년월일 : <%=m.getBirth() %>
						</li>
						<li>
							성별 : <%=m.getGen() %> <br>
							전화 : <%=m.getPhone() %> <br>
							우편번호 : <%=m.getZipcode() %> <br>
							주소 : <%=m.getAddress() %> <br>
							이메일 : <%=m.getEmail() %> <br>
						</li>
						
						<li class='lastli'><a href="javascript:memUpdate('<%=m.getId()%>')">승인하기</a></li>
					</ul>
				</div>
			</li>
		<%	
		}
		%>
		</ul>
	</div>
</div>
<form action="okproc_admin.jsp" name="updateFrm" method="post">
	<input type="hidden" name="id">
</form>

</body>
</html>