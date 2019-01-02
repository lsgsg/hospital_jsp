<%@page import="java.util.GregorianCalendar"%>
<%@page import="hospital.yeyak.DocscBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="insertMgr" class="hospital.yeyak.DocScInsertManager" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String doc_id=(String)session.getAttribute("doctorKey");

ArrayList<DocscBean> list1=new ArrayList();
ArrayList<String> timelist=new ArrayList();
timelist.add("09:00");
timelist.add("10:00");
timelist.add("11:00");
timelist.add("12:00");
timelist.add("13:00");
timelist.add("14:00");
timelist.add("15:00");
timelist.add("16:00");
timelist.add("17:00");
timelist.add("18:00");

boolean flag1=false;

GregorianCalendar today = new GregorianCalendar ( );

String year=Integer.toString(today.get(today.YEAR));
String month=Integer.toString(today.get(today.MONTH) + 1);
String day=Integer.toString(today.get(today.DAY_OF_MONTH ));
String date="";

//달력에서 일을 클릭하면 year,month,day값이 생김. 자바스크립트의 getlist 함수
//flag1=true로 변경
if(request.getParameter("year")!=null){
	year=request.getParameter("year");
	month=request.getParameter("month");
	day=request.getParameter("day");
	date=year+"-"+month+"-"+day;
	list1=insertMgr.getDocSc(date, doc_id);
	flag1=true;
}else{
	date=year+"-"+month+"-"+day;
	list1=insertMgr.getDocSc(date, doc_id);
	flag1=true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/cal.js"></script>
<link href ="../css/style.css" rel="stylesheet" type="text/css">
<!-- 외부의 파일 불러오기 -->
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnPyear").addEventListener("click",
			funcPyear, false);
	document.getElementById("btnPmonth").addEventListener("click",
			funcPmonth, false);
	document.getElementById("btnNmonth").addEventListener("click",
			funcNmonth, false);
	document.getElementById("btnNyear").addEventListener("click",
			funcNyear, false);
<%
	if(flag1){
%>
	func2(<%=year%>,<%=month%>-1);
<%
	}else{
%>
	funcNow();
<%
	}
%>
}

function getlist(year,month,day){
	calform.action="docscinsert.jsp";
	calform.year.value=year;
	calform.month.value=month;
	calform.day.value=day;
	//alert("date: "+year+"-"+month+"-"+day);
	calform.submit();
}

</script>
</head>
<body class="docyeyakinfo_body">
<%@ include file="doc_top.jsp" %>
<div class="docyeyakSession">
	<form action="" class="searchform">
		
		<div class="searchdiv1">
			<button type="submit" class="searchbtnsel">
				<span></span>
			</button>
			<input type="text" name="content" placeholder="검색어를 입력해주세요">
		</div>
		<div class="searchdiv2">
			<select name="search">
				<option value="name">이름</option>
				<option value="name">예약번호</option>
				<option value="name">예약날짜</option>
			</select>
		</div>
	</form>
	
	<div class="downarea">
		<div id="calendar" name='calendar'>
			<div id="etc">
				<button id="btnPyear" class="btnleft">◁</button>
				<button id="btnPmonth" class="btnleft">◀</button>
				<button id="btnNyear" class="btnright">▷</button>
				<button id="btnNmonth" class="btnright">▶</button>
				
			</div>
			<div id="disp"></div>
			<form name="calform" method="post">
				<input type="hidden" name="year" value="<%=year %>"/>
				<input type="hidden" name="month" value="<%=month %>"/>
				<input type="hidden" name="day" value="<%=day %>"/>
			</form>
			<!-- <div class="ring-left"></div>
			<div class="ring-right"></div> -->
		</div>
		<div class="docyeyak2div">
			<div class="selpatient">
				<%
				if(flag1){
				%>
				<span> <%=year%>년 <%=month%>월  <%=day%>일</span>
				<form name="updateForm" method="post" action="docscinsertproc.jsp">
				<ul class="selpatientTbl" style="height:550px;">
				<%
					for(int i=0;i<timelist.size();i++){
						String s=(String)timelist.get(i);
						String b="";	//state값
						for(DocscBean bean:list1){
							if(s.equals(bean.getTime())){
								b=bean.getState(); //state값 넣기
							}
						}
						
						if(b.equals("T")){ //state==T
				%>
					<li><%=s %> <input type="checkbox" name="state" disabled="true" value="<%=s%>"/>예약중</li>
				<%
						}else if(b.equals("F")){ //state==F
				%>
					<li><%=s %> <input type="checkbox" name="changeDSc" value="<%=s %>"/>삭제</li>
				<%
						}else if(b.equals("D")){ //state==D
				%>
					<li><%=s %> <input type="checkbox" name="changeFSc" value="<%=s %>"/>추가</li>
				<%
						}else{ //레코드가 없는 경우
				%>
					<li><%=s %> <input type="checkbox" name="insertSc" value="<%=s %>"/>추가</li>
				<%
						}
					}
				%>
				</ul>
					<input type="submit" value="저장하기"/>
					<input type="hidden" name="year" value="<%=year %>"/>
					<input type="hidden" name="month" value="<%=month %>"/>
					<input type="hidden" name="day" value="<%=day %>"/>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>
</body>
</html>