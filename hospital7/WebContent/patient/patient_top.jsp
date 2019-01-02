<%@page import="hospital.yeyak.HosDeptBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hosDeptMgr" class="hospital.yeyak.HosDeptManager"/>
<%
request.getParameter("utf-8");

String patid = (String)session.getAttribute("patientKey");
String log = ""; 
String mem = "";
String atag="";
//세션값에 의해 메뉴가 바뀜
if(patid == null){
	atag="";
	log = "<a href='../member/login.jsp?sel=환자'>로그인</a>";
}else{
	log = "<a href='../member/logout.jsp'>로그아웃</a>";
	atag="<a href='../member/logout.jsp'>"+ patid +"</a>";
}

if(patid == null){
	mem = "<a href='../member/register.jsp'>회원가입</a>";
}else{
	mem = "<a href='../member/memberupdate.jsp'>회원수정</a>"; //로그인한 클라이언트가 자기 정보 수정
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href ="../css/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class = "header">
        <div class="logo">
          <a href="../index.jsp">
            <img src="../images/logo.png" alt="병원로고">
          </a>
        </div>
        <div class="menubar">
              <ul>
                <li><a href="../patient/info.jsp">병원소개</a>
            					<ul class ="sub">
            						<li><a href="info.jsp">이용안내</a></li>
            					</ul>
            	</li>
                <li><a href="../patient/deptinfo.jsp?dept=%EB%82%B4%EA%B3%BC">진료안내</a>
            					<ul class ="sub">
            						<%
            						ArrayList<HosDeptBean> dlist = hosDeptMgr.getHosDeptAll();
            						for(HosDeptBean dbean:dlist){
            						%>
            							<li><a href="../patient/deptinfo.jsp?dept=<%=dbean.getName()%>"><%=dbean.getName() %></a></li>
            						<%
            						}
            						%>
            					</ul>
            				</li>
            				<li><a href="../patient/yeyak.jsp">진료 / 예약 </a>
            					<ul class ="sub">
            						<li><a href="../patient/yeyak.jsp">예약하기</a></li>
            						<li><a href="../patient/yeyaklist.jsp">예약조회</a></li>
            					</ul>
            				</li>
            				<li> <a href="../board/faqlist.jsp">문의사항</a>
            					<ul class ="sub">
            						<li><a href="../board/faqlist.jsp">FAQ</a></li>
            						<li><a href="../board/qnalist.jsp">Q & A</a></li>
            					</ul>
            				</li>
              </ul>
             <div class="menubarbg2"></div>
        </div>
        <div class="login">
              <%=log %>
			  <%=mem %>
			 <%=atag%>
        </div>
</div>

</body>
</html>