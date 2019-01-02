<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager"/>
<jsp:useBean id="dto" class="hospital.qna.QnaDto"/>
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");	//spage ; page는 키워드라 사용불가
dto = qnaMgr.getReplyData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript">

</script>
</head>
<body class="qnacontent_body">
<%@ include file="../patient/patient_top.jsp" %>
 <div class="section">
		
<h2 style="width:100%;text-align:center; margin-top:70px;">** 댓글쓰기 **</h2>
<form action="replysave.jsp" name="frm" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
<input type="hidden" name="gnum" value="<%=dto.getGnum() %>">
<input type="hidden" name="onum" value="<%=dto.getOnum() %>">
<input type="hidden" name="nested" value="<%=dto.getNested() %>">
	<table class="qnacttTbl">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" class="tblinput" required></td>
		</tr>
		<tr>
			<td>암 호</td>
			<td><input type="password" class="tblinput"  name="pass" required></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" class="tblinput"  name="mail" required></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" class="tblinput" name="title" value="[Re:]:<%=dto.getTitle()%>" required></td>	<!-- type안주면 default: type="text"  -->
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="10" style="width:100%; height:600px" name="cont" required>
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" 
					value="작 성" onclick="check()" class="btn" 
					style="float:right">&nbsp;
				<input class="btn" type="button"
				 value="목 록" onclick="location.href='qnalist.jsp?page=<%=spage%>'"
				 style="float:right; margin-right:5px; height:35px"
				 >
			</td>
		</tr>
	</table>
</form>

 </div>
  <%@ include file="../patient/patient_bottom.jsp" %>
</body>
</html>