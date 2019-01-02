<%@page import="hospital.member.DoctorBean"%>
<%@page import="hospital.yeyak.HosDeptBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="doctorMgr" class="hospital.member.DoctorManager" />
<%
	request.setCharacterEncoding("utf-8");
	String dept = request.getParameter("dept");
%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://idangero.us/swiper/dist/css/swiper.min.css'>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js'></script>
<script type="text/javascript">

$(document).ready(function(e){
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 100,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        autoplay: 5000,
        autoplayDisableOnInteraction: true, // 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
        loop: true
      });
   
 $(".btnDetailAtag").click(function(){
	 $(".deptDetail").css("display","block");
 })
  $(".btnDetailAtag2").click(function(){
	 $(".deptDetail").css("display","block");
 })

  $(".btnX").click(function(){
	 $(".deptDetail").css("display","none");
 })


})
</script>

<script>

function deptChange(dept){
	if(dept === "all"){ 
		location.replace("deptinfo.jsp");
	}else{
		location.replace("deptinfo.jsp?dept=" + dept);		
	}
}

var xhr;
var docdept ="";
function startXhr(name,dept){
	
	var docname = name;
	docdept = dept;
	var fname = "../datas/doctorDetail.jsp";
	
	xhr = new XMLHttpRequest(); //Ajax지원 클래스
	xhr.open("post", fname ,true);
	
	xhr.onreadystatechange = function(){
		
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				processFunc();
			}
			else alert("자바스크립트에서 요청실패 : " + xhr.status);
		}
	}
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("name=" + docname );//post방식일땐 파라미터를 써준다.
}


function processFunc(){
	var data = xhr.responseText;
	var parseData = JSON.parse(data);
	var docname  = parseData.docDetail[0].name;
	var docbirth = parseData.docDetail[0].birth;
	var docemail = parseData.docDetail[0].email;
	var docphone  = parseData.docDetail[0].phone;
	var docimage = parseData.docDetail[0].image;
	var docgen = parseData.docDetail[0].gen;
	
	document.getElementById('docname').innerText = docname;
	document.getElementById('docbirth').innerText = docbirth;
	document.getElementById('docemail').innerText = docemail;
	document.getElementById('docphone').innerText = docphone;
	
	//성별은 한자로 보여주기
	var hanja_gen = "";
	if(docgen === "남"){
		hanja_gen = "男";
	}else if(docgen === "여"){
		hanja_gen = "女";
	}
	
	document.getElementById('docgen').innerText = hanja_gen;
	document.getElementById('docdept').innerText = docdept;
	document.getElementById('docimage').innerHTML = "<img width='150px' alt='의사 사진' src= '../images/"+ docimage + "'>";
	document.docform.name.value = docname;
	document.docform.dept.value = docdept;

}

</script>
</head>
<%@ include file="../patient/patient_top.jsp" %>
<body class="deptinfo">
	<div class="session">
		<div class="yeyakForm2">
		
		<ul class="yeyakFormul">
			<li>
				<span>과선택</span>
				<select name="dept_no" onchange="deptChange(this.value)">
					<option value="all">전체</option>
						<%
							for (HosDeptBean bean:dlist) {
								if(bean.getName().equals(dept)){
									%>
									<option value="<%=bean.getName()%>" selected ><%=bean.getName()%></option>
									<%
								}else{
									%>
									<option value="<%=bean.getName()%>" ><%=bean.getName()%></option>
									<%
								}
							}
						%>
				</select>
			</li>
			
			<li>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<%
						if(dept == null){
						ArrayList<DoctorBean> allDocList = doctorMgr.getDoctorTrue();
						for(DoctorBean bean:allDocList){
						%>
						<div class="swiper-slide depinfoDetail">
			
							<ul>	
								<%
								String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
								%>
							
								<li><img src="../images/<%=bean.getImage() %>" alt="의사사진"></li>
								<li> 
									<%=dept_name%> 의사 <br>
									성명 : <%=bean.getName() %><br>
									<a href="javascript:startXhr('<%=bean.getName() %>','<%=dept_name%>')" class="btnDetailAtag"> 상세보기 </a>
								</li>
										
							</ul>
					   </div>
						<%
							}
						}else{
							String dept_no = hosDeptMgr.getDeptno(dept);
							ArrayList<DoctorBean> doclist = doctorMgr.getDoctorDept(dept_no);
							for(DoctorBean bean:doclist){
						%> 
					  <div class="swiper-slide depinfoDetail">
			
						<ul>
							<%
							String dept_name = hosDeptMgr.getDeptName(Integer.toString(bean.getDept_no()));
							%>
							<li><img src="../images/<%=bean.getImage() %>" alt="의사사진"></li>
							<li>
								<%=dept_name%> 의사<br>
								성명 : <%=bean.getName() %><br>
								<a href="javascript:startXhr('<%=bean.getName()%>','<%=dept_name %>')" class="btnDetailAtag2"> 상세보기 </a>
							</li>
						</ul>

					  </div>

							<%
							}	
						}
						%>
			  
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				     <button type="button" class="swiper-button-next swiperbtn"></button>
				 	 <button type="button" class="swiper-button-prev swiperbtn"></button>
  				</div>
					
			</li>
		</ul>
			
		<!-- 상세보기 눌렀을때 페이지  -->
		<div class="deptDetail">
			<ul>
				<li>
					<div class="profile block"> 
						<div class="profileharf">
							<div class="profile-picture big-profile-picture clear" id="docimage"></div>
				            <h1 class="user-name"><span id ="docname"></span> (<span id ="docgen"></span>)</h1>
				            <span id="docbirth"></span>
                    		<div class="profile-description">
                      			<p class="scnd-font-color">
                      				<form action="yeyak.jsp" method="get" name="docform">
										<input type="hidden" name="name" value="">
										<input type="hidden" name="dept" value="">
										<input type="submit" value="예약하기" id="yeyakbtn">
									</form>
                      			</p>
                   		    </div>
	                   	</div> 
	                   		    
	                   <ul class="profile-options horizontal-list">
	                        <li>
	                        	<a class="comments" href="#">
	                        		<p>
	                        			<span class="icon">
	                        				<img src="../images/icon_dept.svg" alt="의사부서" class="doctor_img">
	                        			</span>
	                        			<span id ="docdept" class="spanClass"></span>
	                        		</p>
	                        	</a>
	                        </li>
	                        <li>
	                        	<a class="views" href="#">
	                        		<p>
	                        			<span class="icon">
	                        				<img src="../images/icon_phone.svg" alt="전화" class="doctor_img">
	                        			</span>
	                        			<span id ="docphone" class="spanClass"></span>
	                        		</p>
	                        	</a>
	                        </li>
	                        
	                        <li>
	                        	<a class="likes" href="#">
	                        		<p>
	                        			<span class="icon">
	                        				<img src="../images/icon_email.svg" alt="의사부서" class="doctor_img">
	                        			</span>
	                        			<span id ="docemail" class="spanClass"></span>
	                        		</p>
	                        	</a>
	                        </li>
	                        
	                    </ul>
             	</div>
				</li>
					<button type="button" class="btnX"><img src="../images/close.svg" alt="닫기"></button>
				</ul>
			
			</div>
			
			
		</div>
	</div>
	<%@ include file="../patient/patient_bottom.jsp"%>
</body>
</html>