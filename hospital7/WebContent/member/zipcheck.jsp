<%@page import="hospital.member.ZipcodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="patientMgr" class="hospital.member.PatientManager"/>
<%
request.setCharacterEncoding("utf-8");

String check = request.getParameter("check");
String p_area3 = request.getParameter("area3");

ArrayList<ZipcodeBean> list = patientMgr.zipRead(p_area3); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("btnZipFind").onclick=dongCheck;
	document.getElementById("btnZipClose").onclick=function(){
		window.close();
	}
}
function dongCheck(){
	if(zipForm.area3.value===""){
		alert("검색할 동이름을 입력하시오");
		zipForm.area3.focus();
		return;
	}
	zipForm.submit();
}

function send(zip,a1,a2,a3,a4){
	//alert(zip+" "+a1);
	opener.document.regForm.zipcode.value=zip;
	var addr=a1+" "+a2+" "+a3+" "+a4;
	opener.document.regForm.address.value=addr;
	window.close();	//주소검색 창 닫기
}
</script>
</head>
<body>
<b>** 우편번호 찾기 **</b><br/>
<form action="zipcheck.jsp" name="zipForm" method="post">
<table>
	<tr>
		<td>
		동이름 입력: <input type="text" name="area3"/>
		<input type="button" value="검색" id="btnZipFind"/> 
		<input type="button" value="닫기" id="btnZipClose"/> 
		<input type="hidden" value="n" name="check"/> 
	</tr>
</table>
</form>
<%
if(check.equalsIgnoreCase("n")){
	if(list.isEmpty()){
%>
	<b>검색결과가 없습니다</b>
<%  }else{
%>
	<table>
		<tr>
			<td>검색자료를 클릭하면 자동으로 주소가 입력됩니다</td>
		</tr>
		<tr>
			<td>
			<%
			for(int i=0;i<list.size();i++){
				ZipcodeBean bean=list.get(i);
				String zipcode=bean.getZipcode();
				String a1=bean.getArea1();
				String a2=bean.getArea2();
				String a3=bean.getArea3();
				String a4=bean.getArea4();
				if(a4==null) a4="";
			%>
			<a href="javascript:send('<%=zipcode%>','<%=a1%>','<%=a2%>','<%=a3%>','<%=a4%>')"><%=zipcode%> <%=a1%> <%=a2%> <%=a3%> <%=a4%></a><br/>
			<%
			}
			%>
			</td>
		</tr>
	</table>
<%	}
}
%>
</body>
</html>