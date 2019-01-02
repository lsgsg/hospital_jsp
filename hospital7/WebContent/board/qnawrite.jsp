<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript">
/* function check(){
	if(frm.name.value == ""){
		alert("이름을 입력하시오");
		frm.name.focus();
		return;
	}
	 
	//나머진 생략
	frm.submit();
} */
</script>
</head>
<body class="qnacontent_body">
<%@ include file="../patient/patient_top.jsp" %>
 <div class="section">
<h2 style="width:100%;text-align:center; margin-top:70px;">** 글쓰기 **</h2>
<!-- 원래는 id 받아서 새글작성 들어가야 됭 -->
<form action="qnasave.jsp" name="frm" method="post">
<table class="qnacttTbl">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" class="tblinput"required></td>
	</tr>
		<tr>
		<td>암호</td>
		<td><input type="password" name="pass" class="tblinput" required></td>
	</tr>
		<tr>
		<td>이메일</td>
		<td><input type="email" name="mail" class="tblinput" required></td>
	</tr>
		<tr>
		<td>글제목</td>
		<td><input name="title"  class="tblinput" required></td>	<!-- type안주면 default: type="text"  -->
	</tr>
	<tr>
		<td colspan="2">
				<textarea rows="10" style="width:100%; height:600px" name="cont" required>
				</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" value="메 인" onclick="location.href='../index.jsp'">&nbsp;
			<input type="submit" value="작 성" onclick="check()">&nbsp;
			<input type="button" value="목 록" onclick="location.href='qnalist.jsp'">
	</tr>
</table>
</form>
 </div>
  <%@ include file="../patient/patient_bottom.jsp" %>
</body>

</html>