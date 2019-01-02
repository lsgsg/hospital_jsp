<%@page import="java.util.GregorianCalendar"%>
<%@page import="hospital.yeyak.DocYeyakBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.DocYeyakManager"
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String doc_id = (String) session.getAttribute("doctorKey");

	ArrayList<DocYeyakBean> list1 = new ArrayList();
	ArrayList<DocYeyakBean> list2 = new ArrayList();

	boolean flag1 = false;
	boolean flag2 = false;

	GregorianCalendar today = new GregorianCalendar();

	String year = Integer.toString(today.get(today.YEAR));
	String month = Integer.toString(today.get(today.MONTH) + 1);
	String day = Integer.toString(today.get(today.DAY_OF_MONTH));
	String date = "";
	String pat_id = "";
	String pat_name = "";

	//달력에서 일을 클릭하면 year,month,day값이 생김. 자바스크립트의 getlist 함수
	//flag1=true로 변경
	if (request.getParameter("year") != null) {
		year = request.getParameter("year");
		month = request.getParameter("month");
		day = request.getParameter("day");
		date = year + "-" + month + "-" + day;

		list1 = yeyakMgr.getDocSc(date, doc_id);
		flag1 = true;
	} else {
		date = year + "-" + month + "-" + day;

		list1 = yeyakMgr.getDocSc(date, doc_id);
		flag1 = true;
	}

	//이름을 클릭하면 pat_id값이 생김. 자바스크립트의 getYeyakAll 함수
	//flag2=true로 변경
	if (request.getParameter("pat_id") != null) {
		pat_id = request.getParameter("pat_id");
		pat_name = request.getParameter("pat_name");
		year = request.getParameter("year");
		month = request.getParameter("month");
		day = request.getParameter("day");
		date = year + "-" + month + "-" + day;

		list2 = yeyakMgr.getYeyakAll(pat_id, doc_id);
		flag2 = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/cal.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
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
<%if (flag1) {%>
	func2(<%=year%>,<%=month%>-1);
<%} else {%>
	funcNow();
<%}%>
}

function getlist(year,month,day){
	calform.action="docyeyakinfo.jsp";
	//alert("day: "+no);
	calform.year.value=year;
	calform.month.value=month;
	calform.day.value=day;
	calform.submit();
}

function getYeyakAll(yform,pat_name,pat_id,year,month,day){
	var form=document.getElementsByName(yform)[0];
	form.pat_id.value=pat_id;
	form.pat_name.value=pat_name;
	form.year.value=year;
	form.month.value=month;
	form.day.value=day;	
	form.submit();
}

function updateCost(no){
	location.href="updateCost.jsp?yeyak_no="+no;
}
	
</script>
</head>
<body class="docyeyakinfo_body">
	<%@ include file="doc_top.jsp"%>
	<div class="docyeyakSession">
		<form action="" class="searchform">

			<div class="searchdiv1">
				<button type="submit" class="searchbtnsel">
					<span></span>
				</button>
				<input type="text" name="content" placeholder="검색어를 입력

해주세요">
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
					<input type="hidden" name="year" value="" /> <input type="hidden"
						name="month" value="" /> <input type="hidden" name="day" value="" />
				</form>
				<!-- <div class="ring-left"></div>
			<div class="ring-right"></div> -->
			</div>
			<div class="docyeyak2div">
				<div class="selpatient">

					<ul class="selpatientTbl">
						<span> <%=year%>년 <%=month%>월 <%=day%>일 예약환자
						</span>
						<%
							if (flag1 && list1.size() > 0) {
								for (DocYeyakBean b : list1) {
						%>
						<li><a href="#" class="selec"
							onclick="getYeyakAll('<%=b.getPat_id() + "_form"%>','<%=b.getPat_name()%>','<%=b.getPat_id()%>',
							'<%=year%>','<%=month%>','<%=day%>')">
								<%=b.getPat_name()%>
						</a> <span><%=b.getPat_age()%></span> <span><%=b.getPat_gen()%></span>
							<input type="button" value="진료보기"
							onclick="updateCost('<%=b.getNo()%>')" />
							<form action="docyeyakinfo.jsp" method="post"
								name="<%=b.getPat_id() + "_form"%>">
								<input type="hidden" name="pat_id" value="" /> <input
									type="hidden" name="pat_name" value="" /> <input type="hidden"
									name="year" value="" /> <input type="hidden" name="month"
									value="" /> <input type="hidden" name="day" value="" />
							</form></li>
						<%
							}
							} else {
						%>
						<li>예약 환자 내역이 없습니다.</li>
						<%
							}
						%>
					</ul>
				</div>
				<div>
					<%
						if (flag2) {
					%>
					<h3 class="tblh3">
						<span> &nbsp;<%=pat_name%>님 &nbsp;
						</span> 의 전체 진료차트 입니다
					</h3>
					<table border="1" class="yeyakdetailtbl">
						<tr>
							<th>예약번호</th>
							<th>이름</th>
							<th>나이</th>
							<th>성별</th>
							<th>환자상태</th>
							<th>예약일</th>
							<th>진료시간</th>
							<th>진료상태</th>
							<th>방문상태</th>
							<th>수납상태</th>
						</tr>
						<%
							for (DocYeyakBean b : list2) {
						%>
						<tr>
							<td><%=b.getNo()%></td>
							<td><%=b.getPat_name()%></td>
							<td><%=b.getPat_age()%></td>
							<td><%=b.getPat_gen()%></td>
							<td><%=b.getDetail()%></td>
							<td><%=b.getDate()%></td>
							<td><%=b.getTime()%></td>
							<td><%=b.getYeyak_state

					()%></td>
							<td>초진/ 재진</td>
							<td><%=b.getCost()%></td>


						</tr>
						<%
							}
						%>
					</table>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>