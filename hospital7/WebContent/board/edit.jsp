<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" />
<jsp:useBean id="dto" class="hospital.qna.QnaDto" />
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
dto = qnaMgr.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
function check(){
	if(frm.pass.value == ""){
		alert("비밀번호를 입력하시오"); //딱히 바람직하지 않은 방식
		frm.name.focus();
		return;
	}
	
	if(confirn("정말 수정할까요?")) frm.submit();
}
</script>
</head>
<body>
<h2>** 글수정 **</h2>
<form action="editsave.jsp" name="frm" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" size="15" value="<%=dto.getName() %>" required></td>
	</tr>
		<tr>
		<td>암호</td>
		<td><input type="password" name="pass" size="15" required></td>	<!-- 암호는 안바꿀거 -->
	</tr>
		<tr>
		<td>이메일</td>
		<td><input type="email" name="mail" size="25" value="<%=dto.getMail() %>" required></td>
	</tr>
		<tr>
		<td>글제목</td>
		<td><input name="title" size="15" value="<%=dto.getTitle() %>" required></td>
	</tr>
		<tr>
		<td>글내용</td>
		<td><textarea rows="10" cols="50" name="cont" required><%=dto.getCont() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="수 정" onclick="check()">&nbsp;
			<input type="button" value="목 록" onclick="location.href='qnalist.jsp?page=<%=spage%>'">
	</tr>
</table>
</form>
</body>
</html>