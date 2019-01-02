<%@page import="hospital.member.PatientBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<%
String id = (String)session.getAttribute("patientKey");

PatientBean bean = patientMgr.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}

</script>
</head>
<body class="register_body">
<%@ include file="../patient/patient_top.jsp" %>
 <div class="section">
    	<form name="regForm" method="post" action="memberupdateproc.jsp" class="registerform">
          <h2> 회원 정보수정 </h2>
    			<table>

    				<tr>
    					<td>아이디</td>
    					<td> 
	    					<input type="text" name="id" value="<%=bean.getId() %>" 
	    					style="width: 90%;background-color:#eeeeee;" readonly>
    					</td>
    				</tr>
    				<tr>
    					<td>패스워드</td>
    					<td><input type="password" name="passwd"></td>
    				</tr>
    				<tr>
    					<td>패스워드 확인</td>
    					<td><input type="password" name="repasswd"></td>
    				</tr>
    				<tr>
    					<td>이름</td>
    					<td><input type="text" name="name" value="<%=bean.getName() %>"></td>
    				</tr>
    				<tr>
    					<td>성별</td>
    					<td style="padding-left: 5%; text-align:left;">
    					<%
    					if(bean.getGen().equals("남")){
    					%>
    						<input type="radio" name="gen" value="남" checked="checked">남자 &nbsp; &nbsp; 
    						<input type="radio" name="gen" value="여">여자
    					<%
    					}else{
    					%>
    						<input type="radio" name="gen" value="남">남자 &nbsp; &nbsp; 
    						<input type="radio" name="gen" value="여" checked="checked">여자
    					<%
    					}
    					%>
    						</td>
    				</tr>
    				<tr>
    					<td>나이</td>
    					<td style="padding-left: 5%; text-align:left;"><input type="number" name="age" style="width:15%;height:37px;" value="<%=bean.getAge() %>">세 
	    					<select name="month" style="height:37px;">
	    					<%
	    					for(int i=1;i<13;i++){
	    						if(i==bean.getMonth()){
	    	    			%>
	    						<option value="<%=i %>" selected="selected"><%=i %>
	    					<%
	    						}else{
	    					 %>
	    						<option value="<%=i %>"><%=i %>
	    					<%
	    						}
	    					}
	    					%>
	    					</select>월 
	    					<select name="day" style="height:37px;">
	    					<%
	    					for(int i=1;i<31;i++){
	    						if(i==bean.getDay()){
	    					%>
	    						<option value="<%=i %>" selected="selected"><%=i %>
	    					<%
	    						}else{
	    					 %>
	    						<option value="<%=i %>"><%=i %>
	    					<%
	    						}
	    					}
	    					%>
	    					</select>일 
	    					</td>
    				</tr>
    				<tr>
    					<td>이메일</td>
    					<td><input type="text" name="email" value="<%=bean.getEmail() %>"></td>
    				</tr>
    				<tr>
    					<td>전화번호</td>
    					<td><input type="text" name="phone" value="<%=bean.getPhone() %>"></td>
    				</tr>
    				<tr>
    					<td>우편번호</td>
    					<td>
    						<input type="text" name="zipcode" value="<%=bean.getZipcode() %>">
    						<input type="button" value="우편번호찾기" id="btnZip">
    					</td>
    				</tr>
    				<tr>
    					<td>주소</td>
    					<td><input type="text" name="address" value="<%=bean.getAddress() %>"></td>
    				</tr>
    				<tr>
    					<td>직업</td>
    					<td>
    						<select name=job>
    							<option value="<%=bean.getJob() %>"><%=bean.getJob() %>
    							<option value="회사원"<% if(bean.getJob().equals("회사원")) out.print( "selected=\"selected\""); %>>회사원
    							<option value="학생"<% if(bean.getJob().equals("학생")) out.print( "selected=\"selected\""); %>>학생
    							<option value="자영업"<% if(bean.getJob().equals("자영업")) out.print( "selected=\"selected\""); %>>자영업
    							<option value="주부"<% if(bean.getJob().equals("주부")) out.print( "selected=\"selected\""); %>>주부
    							<option value="기타"<% if(bean.getJob().equals("기타")) out.print( "selected=\"selected\""); %>>기타
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<input type="button"
    						value="정보수정" id="btnSubmit" class="registerbtn regibtn1">
    						&nbsp;&nbsp;&nbsp;&nbsp;
    						<input type="reset" value="다시쓰기" class="registerbtn regibtn2">
    					</td>
    				</tr>
    			</table>
    		</form>
  </div>
   <%@ include file="../patient/patient_bottom.jsp" %>
</body>
</html>