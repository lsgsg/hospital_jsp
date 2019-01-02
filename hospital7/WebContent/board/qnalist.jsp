<%@page import="hospital.qna.QnaDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qnaMgr" class="hospital.qna.QnaManager" />
<jsp:useBean id="dto" class="hospital.qna.QnaDto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
</head>
<body class="qnalist_body">
<%@ include file="../patient/patient_top.jsp" %>
<div class="session">

	
	
	
	



<!-- boardTypeTbl -->
<div class="boardTypeTbl">
	<h2> 문의사항 </h2>
		<form action="qnalist.jsp" name="frm" method="post" class="searchform">
		
		<div class="searchdiv1">
			<button type="submit" class="searchbtnsel">
				<span></span>
			</button>
			<input type="text" name="sword" placeholder="검색어를 입력해주세요" required >
		</div>
		<div class="searchdiv2">
			<select name="stype">
				<option value="title" selected="selected">글제목</option>
				<option value="name">작성자</option>
				<!-- <option value="name">제목 + 내용</option> -->
			</select>
		</div>
	</form>

			
			<div class="atagall">
			[<a href="../index.jsp">메인으로</a>]&nbsp;
			[<a href="qnalist.jsp?page=1">최근목록</a>]&nbsp;
		
			</div>
			<table style="width: 100%">
			<tr style="background-color: silver;">
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
			<%
			int pageSu, spage = 1;
			request.setCharacterEncoding("utf-8");
			try{
				spage = Integer.parseInt(request.getParameter("page"));
			}catch(Exception e){
				spage = 1;
			}
			if(spage <= 0) spage = 1;
			
			String stype = request.getParameter("stype");
			String sword = request.getParameter("sword");
			
			qnaMgr.totalList(); //전체 레코드 수 계산
			pageSu = qnaMgr.getPageSu(); //전체 페이지수 얻기
			
			ArrayList<QnaDto> list = qnaMgr.getDataAll(spage, stype, sword);
			for(int i = 0; i < list.size(); i++){
				dto = (QnaDto)list.get(i);
				
				//댓글 들여쓰기
				int nst = dto.getNested();
				String tab = "";
				for(int k=0; k < nst; k++){
					tab += "&nbsp;&nbsp;";
				}
						
			%>
						<tr>
				<td><%= dto.getNum() %></td>
				<td>
					<%=tab %>
					<a href="qnacontent.jsp?num=<%= dto.getNum() %>&page=<%= spage%>">
					<%= dto.getTitle() %></a>
				</td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getBdate() %></td>
				<td><%= dto.getReadcnt() %></td>			
			</tr>
			<%
			}
			%>
		</table>
		<br>
		<table class="qnalisttbl2">
			<tr>
				<td>
				<%
				for(int i = 1; i <= pageSu; i++){
					if(i == spage){
						out.print("<b style='font-size:12pt;color:#075577'>" + i + "</b>");
					}else{
						out.print("<a class='qnalista' href='qnalist.jsp?page=" + i + "'>" + i + "</a>");
					}
				}
				%>
				<br><br>
				</td>
				<td>
					<a href="qnawrite.jsp">새글작성</a>
				</td>
			</tr>
		</table>	
	

</div>
</div>
<%@ include file="../patient/patient_bottom.jsp"%>
</body>
</html>