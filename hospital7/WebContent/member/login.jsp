<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String sel = request.getParameter("sel");

if(sel == null) sel = "환자"; // sel이 null값일 땐 equals 못씀
else if(sel.equals("admin")) sel = "관리자";
else if(sel.equals("doctor")) sel = "의사";
//System.out.println(sel);
%>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link href ="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="login_body">
    <div class="section">
          <form name="member_form" method="post" action="loginproc.jsp" class="loginform">
                <h2><a href="../index.jsp"><img src="../images/logo.png" alt="logo"></a></h2>
                <select name="sel" class="loginIn">
                <%
               String[] part = {"환자", "의사", "관리자"};
                for(String p : part) {
	                if(p.equals(sel)){
	            %>
	                <option value="<%= p %>" selected><%= p %></option>	            
                <%
               		}else{
               			%>
               		  <option value="<%= p %>"><%= p %></option>
               			<%
               		}
                }
                %>
                </select>
                <input name="id" type="text" placeholder="Username" class="login_input loginIn" required/>
                <input name="passwd" type="password" placeholder="Password" class="login_input loginIn" required/>
                <button type="submit" class="btnfos btnfos-5 loginIn">Login</button>
                <button type="button" class="btnJoin loginIn" onclick="location.href = '../doctor/doc_register.jsp'">create a new account</button>
                <p class="loginIn">아이디를 잊으셨나요? &nbsp;&nbsp;&nbsp;<a href="#">아이디 / 비밀번호 찾기 </a></p>
                <p class="loginIn"><a href="../doctor/doc_register.jsp">의사 가입 바로가기</a></p>
          </form>
    </div>
<%@ include file="../patient/patient_bottom.jsp" %>
</body>
</html>