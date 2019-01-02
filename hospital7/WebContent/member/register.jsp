<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}

</script>
</head>
<body class="register_body">
<%@ include file="../patient/patient_top.jsp" %>
 <div class="section">

    		<form name="regForm" method="post" action="registerproc.jsp" class="registerform">
          <h2> 회원가입 </h2>
    			<table>

    				<tr>
    					<td>아이디</td>
    					<td>
                <input type="text" name="id">
    						<input type="button" value="ID중복확인" id="btnId">
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
    					<td><input type="text" name="name"></td>
    				</tr>
    				<tr>
    					<td>성별</td>
    					<td style="padding-left: 5%; text-align:left;">
    						<input type="radio" name="gen" value="남">남자 &nbsp; &nbsp; 
    						<input type="radio" name="gen" value="여">여자</td>
    				</tr>
    				<tr>
    					<td>나이</td>
    					<td style="padding-left: 5%; text-align:left;">
    						<input type="number" name="age" style="width:15%;">세 
	    					<select name="month">
	    						<option value="1">1
	    						<option value="2">2
	    						<option value="3">3
	    						<option value="4">4
	    						<option value="5">5
	    						<option value="6">6
	    						<option value="7">7
	    						<option value="8">8
	    						<option value="9">9
	    						<option value="10">10
	    						<option value="11">11
	    						<option value="12">12
	    					</select>월 
	    					<select name="day">
	    						<option value="1">1
	    						<option value="2">2
	    						<option value="3">3
	    						<option value="4">4
	    						<option value="5">5
	    						<option value="6">6
	    						<option value="7">7
	    						<option value="8">8
	    						<option value="9">9
	    						<option value="10">10
	    						<option value="11">11
	    						<option value="12">12
	    						<option value="13">13
	    						<option value="14">14
	    						<option value="15">15
	    						<option value="16">16
	    						<option value="17">17
	    						<option value="18">18
	    						<option value="19">19
	    						<option value="20">20
	    						<option value="21">21
	    						<option value="22">22
	    						<option value="23">23
	    						<option value="24">24
	    						<option value="25">25
	    						<option value="26">26
	    						<option value="27">27
	    						<option value="28">28
	    						<option value="29">29
	    						<option value="30">30
	    						<option value="31">31
	    					</select>일 
	    					</td>
    				</tr>
    				<tr>
    					<td>이메일</td>
    					<td><input type="text" name="email"></td>
    				</tr>
    				<tr>
    					<td>전화번호</td>
    					<td><input type="text" name="phone"></td>
    				</tr>
    				<tr>
    					<td>우편번호</td>
    					<td>
    						<input type="text" name="zipcode">
    						<input type="button" value="우편번호찾기" id="btnZip">
    					</td>
    				</tr>
    				<tr>
    					<td>주소</td>
    					<td><input type="text" name="address"></td>
    				</tr>
    				<tr>
    					<td>직업</td>
    					<td>
    						<select name=job>
    							<option value="0">선택하세요
    							<option value="회사원">회사원
    							<option value="학생">학생
    							<option value="자영업">자영업
    							<option value="주부">주부
    							<option value="기타">기타
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<td colspan="2">
    						<input type="button"
    						value="회원가입" id="btnSubmit" class="registerbtn regibtn1">
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