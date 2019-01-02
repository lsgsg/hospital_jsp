<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="insertMgr" class="hospital.yeyak.DocScInsertManager"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String doc_id=(String)session.getAttribute("doctorKey");

String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String date=year+"-"+month+"-"+day;

String[] changeDSc=request.getParameterValues("changeDSc");
boolean b1=false;
if(changeDSc!=null){
	for(int i=0;i<changeDSc.length;i++){
		b1=insertMgr.changeDSc(doc_id,date,changeDSc[i]);
	}
}

String[] changeFSc=request.getParameterValues("changeFSc");
boolean b2=false;
if(changeFSc!=null){
	for(int i=0;i<changeFSc.length;i++){
		b2=insertMgr.changeFSc(doc_id,date,changeFSc[i]);
	}
}

String[] insertSc=request.getParameterValues("insertSc");
boolean b3=false;
if(insertSc!=null){
	for(int i=0;i<insertSc.length;i++){
		b3=insertMgr.insertSc(doc_id,date,insertSc[i],"F");
	}
}

response.sendRedirect("docscinsert.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>