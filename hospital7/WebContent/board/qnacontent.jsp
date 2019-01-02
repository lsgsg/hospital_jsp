<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager"/>
<jsp:useBean id="dto" class="hospital.qna.QnaDto"/>

<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
//System.out.println(num + " " + spage);

qnaMgr.updateReadcnt(num);	//조회수 증가
dto = qnaMgr.getData(num);	//해당 자료 읽기

String name = dto.getName();
String pass = dto.getPass();
String mail = dto.getMail();
String title = dto.getTitle();
String cont = dto.getCont();
String bip = dto.getBip();
String bdate = dto.getBdate();
int cnt = dto.getReadcnt();

String apass = "*****";
String adminOk = (String)session.getAttribute("adminOk");
if(adminOk != null){
	if(adminOk.equals("admin")) apass = pass;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판-상세보기</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body class="qnacontent_body">
<%@ include file="../patient/patient_top.jsp" %>
 <div class="section">
		<table class="qnacttTbl">
		
		
			<tr>
				<td colspan="2"><b>비밀번호: <%=apass %></b></td>	<!-- 보이지 않게 하는 게 정석 -->

			</tr>
			<tr>
				<td colspan="2"> 
					<span>
						작성자:
						<a href="mailto:<%=mail%>"><%=name %></a>
						(ip: <%=bip %>)
					</span>
				</td>
			</tr>
			<tr>
				<td> <b>작성일: <%=bdate %> </b></td>
				<td> <b>조회수: <%=cnt %> </b></td>
			</tr>
			<tr>
				<td colspan="2"> <b> 제목: <%=title %> </b>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" style="width: 100%; height:600px; cursor:default;" readonly><%=cont %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;">
					<a class="aa" href="reply.jsp?num=<%=num %>&page=<%=spage %>">댓글쓰기</a>
					<a class="aa"  href="edit.jsp?num=<%=num %>&page=<%=spage %>">수정하기</a>
					<a class="aa"  href="del.jsp?num=<%=num %>&page=<%=spage %>">삭제하기</a>
					<a class="aa"  href="qnalist.jsp?&page=<%=spage %>">목록으로</a>
				</td>
			</tr>
		</table>
 </div>
  <%@ include file="../patient/patient_bottom.jsp" %>
</body>
</html>