<%@page import="java.util.Calendar"%>
<%@page import="hospital.member.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager" />
<jsp:useBean id="docscMgr" class="hospital.yeyak.DocscManager"/>
<%

if((String)session.getAttribute("patientKey") == null){
%>
	<script>
   alert("로그인 후 예약 가능합니다.");
   location.href= "../member/login.jsp";
   </script>
   <%}else{


request.setCharacterEncoding("utf-8");
String dept = request.getParameter("dept");
String name = request.getParameter("name"); //전역변수인 dept와 name 설정

int year = 0;
int month = 0;
int day = 0;

if(request.getParameter("year") != null){
	year = Integer.parseInt(request.getParameter("year"));
	month = Integer.parseInt(request.getParameter("month"));
	day = Integer.parseInt(request.getParameter("day"));
}else{
	Calendar cal = Calendar.getInstance();
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH) + 1;
	day = cal.get(Calendar.DATE);
}

String date = "";
if(month < 10 & day < 10){
	date = year + "-0" + month + "-0" + day;
}else if(month < 10){
	date = year + "-0" + month + "-" + day;
}else if(day < 10){
	date = year + "-" + month + "-0" + day;
}else{
	date = year + "-" + month + "-" + day;
}

System.out.println(date);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
<script type="text/javascript" src="../js/cal_patyeyak.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	$(".oksc").click(function() {
		$(".caltbl").show("display", "block");
	})
	
	$(".atagBtn").click(function(){
		var aheight = $(this).height();
		var abottom = $(this).offset().top + aheight;
	})
	
})

function getlist(no){
	//url을 yeyak.jsp가 아닌 dept, name을 받게 하기.
	//alert(decodeURI(location.toString()));
	var dept = getParameterByName("dept");
	var name = getParameterByName("name");
 	if(dept === "" & name === ""){
 		calform.action="yeyak.jsp";
	}else if(dept === ""){
		calform.action="yeyak.jsp?name=" + name;
	}else if(name === ""){
		calform.action="yeyak.jsp?dept=" + dept;
	}else{
		calform.action="yeyak.jsp?dept=" + dept + "&name=" + name;
	}

	//alert("day: "+no);
	calform.day.value = no;
	calform.submit();
}

function deptChange(dept){
	if(dept === "all"){ 
		location.replace("yeyak.jsp");
	}else{
		location.replace("yeyak.jsp?dept=" + dept);		
	}
}

function nameChange(name){
	location.replace(updateURLParameter(location.toString(), "name", name));
}

//이름 바꿨을 때 URL 바꾸는 함수
function updateURLParameter(url, param, paramVal){
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0]; // '?' 앞의 url
    var additionalURL = tempArray[1]; // '?' 뒤의 url
    var temp = "";
    if (additionalURL) {
        tempArray = additionalURL.split("&");
        for (var i=0; i < tempArray.length; i++){
            if(tempArray[i].split('=')[0] != param){
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    }

    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}

//URL의 변수 받는 함수
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

window.onload = function() {
	funcNow();

	document.getElementById("btnPyear").addEventListener("click",
			funcPyear, false);
	document.getElementById("btnPmonth").addEventListener("click",
			funcPmonth, false);
	document.getElementById("btnNmonth").addEventListener("click",
			funcNmonth, false);
	document.getElementById("btnNyear").addEventListener("click",
			funcNyear, false);
}

</script>
</head>
<body class="yeyak_body">
	<%@ include file="../patient/patient_top.jsp"%>
	<%
	//부서를 select에서 변경했을 때, 부서값만 있고 이름은 없음. 이때 이름은 해당 부서의 첫번째 의사.(getFirstDoctor)
	if(name == null & dept != null) {
		name = doctorMgr.getFirstDoctor(hosDeptMgr.getDeptno(dept));
	}
	%>
	<div class="session">
		<div class="yeyakForm">
			<ul class="yeyakFrmul">
				<li>
				<select name="dept" onchange="deptChange(this.value)">
						<option value="all">전체</option>
						<%
						for (HosDeptBean bean:dlist) {
							if(bean.getName().equals(dept)){ //bean값과 멤버변수 dept가 일치하는게 선택되어있게 하기
						%>
						<option value="<%=bean.getName()%>" selected><%=bean.getName()%></option>
						<%
							}else{
						%>
						<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
						<%
							}
						}
						%>
				</select>
				<select name="name" onchange="nameChange(this.value)">
						<%
						if(dept == null){
							if(name == null) name = doctorMgr.getFirstDoctor();
							
							ArrayList<DoctorBean> allDocList = doctorMgr.getDoctorTrue();
							for(DoctorBean bean:allDocList){
								if(bean.getName().equals(name)){
								%>
								<option value="<%=bean.getName()%>" selected><%=bean.getName()%></option>
								<%
								}else{
								%>
								<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
								<%
								}
							}
						}else{
							String dept_no = hosDeptMgr.getDeptno(dept);
							ArrayList<DoctorBean> doclist = doctorMgr.getDoctorDept(dept_no);
							for (DoctorBean bean:doclist) {
								if(bean.getName().equals(name)){
								%>
								<option value="<%=bean.getName()%>" selected><%=bean.getName()%></option>
								<%
								}else{
								%>
								<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
								<%
								}
							}
						}
						%>
				</select>
				</li>
				<li>
					<table class="introDoc">
					<%
					//의사 개인정보
					if(dept == null){
						DoctorBean bean = doctorMgr.getDoctorName(name);
					%>
						<tr>
						<td><img src="../images/<%=bean.getImage() %>" alt="의사사진"></td>
						<td class="crear"></td>
						<td>
						<%
						String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
						%>
						<%=dept_name %> 의사<br>
						성명 : <%=bean.getName() %><br>
						생년월일 : <%=bean.getBirth() %><br>
						이메일 : <%=bean.getEmail() %><br>
						성별 : <%=bean.getGen() %><br>
						연락처 : <%=bean.getPhone().substring(0, 3) + "-" + //이건 더 생각해보기(자르는것)d
						bean.getPhone().substring(3, 7) + "-" +
						bean.getPhone().substring(7, bean.getPhone().length())%>
						</td>
					</tr>
						<%
					}else{
						String dept_no = hosDeptMgr.getDeptno(dept);
						DoctorBean bean = doctorMgr.getDoctorDeptName(dept_no, name);
						%>
						<tr>
						<td><img src="../images/<%=bean.getImage() %>" alt="의사사진"></td>
						<td class="crear"></td>
						<td>
						<%
						String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
						%>
						<%=dept_name %> 의사<br>
						성명 : <%=bean.getName() %><br>
						생년월일 : <%=bean.getBirth() %><br>
						이메일 :  <%=bean.getEmail() %><br>
						성별 : <%=bean.getGen() %><br>
						연락처 : <%=bean.getPhone().substring(0, 3) + "-" +
						bean.getPhone().substring(3, 7) + "-" +
						bean.getPhone().substring(7, bean.getPhone().length())%><br>
						</td>
					</tr>
					<%
					}
					%>
					</table>
				</li>
			</ul>
			<!-- 달력 부분 -->
			<div id="calendar" name="calendar">
				<div id="etc">
				<button id="btnPyear" class="btnleft">◁</button>
				<button id="btnPmonth" class="btnleft">◀</button>
				<button id="btnNyear" class="btnright">▷</button>
				<button id="btnNmonth" class="btnright">▶</button>
				</div>
				<div id="disp"></div>
			<!-- <div class="ring-left"></div>
			<div class="ring-right"></div> -->
			</div>
			<form action="yeyakproc.jsp" method="post" name="yeyakForm">
			<table class="yeyakseltbl">
				<tr>
					<td colspan="5">
					<p><%=year + "년 " + month + "월 " + day + "일 예약현황"%></p>
					<span> <b></b> 은 예약불가</span> 
					</td>
				</tr>
				<tr>
					<%
					//radio버튼 부분
					
					//그 날의 예약 bean 모두 불러오는 메소드 필요??

					String doc_id = doctorMgr.getIdOfDoc(name);
					String time = "";
					boolean b = false;
				
					for(int i = 9; i <= 18; i ++){
						time = i + ":00"; //시간을 DB 값에 맞게 바꿔줌
						if(time.equals("9:00")) time = "09:00"; //9시 처리
						b = docscMgr.ifScheduleOnTime(doc_id, date, time);
						
						//input의 value는 9 ~ 18 값을 가짐
						if(b == true){ //예약 차 있는 상태
							%>
							<td style="background-color:#fff; color:#f26">
							<%= time %>
							<%
						}else{ //예약 비어 있는 상태
							%>
							<td>
							<input type="radio" name="time" value="<%= time %>" required>
							<%= time %>
							<%
						}
						%>
						</td>
						<%
						if(i == 13){ //행 바꾸기
							%>
							</tr>
							<tr>
							<%
						}
					}
					%>
				<tr>
					<td colspan="5">
					<input type="text" name="detail" placeholder="환자 본인의 증상을 입력해주세요" required>
					<input type="hidden" name="doc_id" value="<%=doc_id%>">
					<input type="hidden" name="date" value="<%=date%>">
					<input type="submit" value="예약하기" id="yeyakbtn2">
					</td>
				</tr>
			</table>
			</form>
<%
   }
%>
		</div>
	</div>
	<%@ include file="../patient/patient_bottom.jsp"%>
</body>
</html>