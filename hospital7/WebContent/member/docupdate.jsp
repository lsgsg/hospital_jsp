<%@page import="hospital.member.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager"/>
<%
String id = (String)session.getAttribute("doctorKey");

DoctorBean bean = doctorMgr.getDoctorId(id);
String dept_name="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사정보 수정</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnSubmit").onclick = inputCheck2;
}

</script>
</head>
<body class="register_body">
<%@ include file="../doctor/doc_top.jsp" %>
 <div class="section">
    	<form name="regForm" method="post" action="docupdateproc.jsp" class="registerform">
          <h2> 회원 정보수정 </h2>
    			<table>
    				<tr>
    					<td>사진</td>
    					<td style="padding-left: 5%; text-align:left;"><img src="../images/<%=bean.getImage() %>" style="width:150px;height:150px;border-radius:100%;overflow:hidden;border:5px solid #54a1c6;margin:0 auto;" alt=""/>
    					<input type="file" name="image" accept="image/*" value="<%=bean.getImage() %>">    					
    					</td>
    				</tr>
    				<tr>
    					<td>아이디</td>
    					<td><input type="text" name="id" value="<%=bean.getId() %>" style="width: 90%;background-color:#eeeeee;" readonly="readonly"></td>
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
    					<td>과</td>
    					<td>
    					<select name="dept_no" style="width:90%; height:37px;">
    						<option value="101"<% if(bean.getDept_no()==101) out.print( "selected=\"selected\""); %>>내과</option>
    						<option value="102"<% if(bean.getDept_no()==102) out.print( "selected=\"selected\""); %>>외과</option>
    						<option value="103"<% if(bean.getDept_no()==103) out.print( "selected=\"selected\""); %>>안과</option>
    						<option value="104"<% if(bean.getDept_no()==104) out.print( "selected=\"selected\""); %>>치과</option>
    						<option value="105"<% if(bean.getDept_no()==105) out.print( "selected=\"selected\""); %>>소아과</option>
    					</select>
    					
    					</td>
    				</tr>
    				<tr>
    					<td>생년월일</td>
    					<td><input type="number" name="birth" style="width:90%;height:37px;" value="<%=bean.getBirth() %>"></td>
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
    					<td>승인</td>
    					<td style="padding-left: 5%; text-align:left;"><%=bean.getOk() %></td>
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
</body>
</html>