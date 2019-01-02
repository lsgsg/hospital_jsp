<%@page import="hospital.yeyak.DocYeyakBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.DocYeyakManager" scope="session"></jsp:useBean>
<% 
request.setCharacterEncoding("utf-8"); 
int yeyak_no=Integer.parseInt(request.getParameter("yeyak_no"));
int cost=Integer.parseInt(request.getParameter("cost"));

boolean b=yeyakMgr.updateCost(yeyak_no, cost);
response.sendRedirect("docyeyakinfo.jsp");

%>