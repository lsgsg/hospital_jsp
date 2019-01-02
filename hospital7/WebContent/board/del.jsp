<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" />
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
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
	if(confirm("정말 삭제할까요?")) frm.submit();
}
</script>
</head>
<body>
<h2>** 글삭제 **</h2>
<form action="delOk.jsp" name="frm" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
비밀번호 입력: <input type="password" name="pass">
<input type="button" value="삭제 확인" onclick="check()">&nbsp;
<input type="button" value="목 록" onclick="location.href='qnalist.jsp?page=<%=spage%>'">
</form>
</body>
</html>