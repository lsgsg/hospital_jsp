<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
/* out.println(name + "제발나와라"); */
%>
{"docDetail":
[
	<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result="";
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		
	}catch(Exception e){
		System.out.println("연결 오류 " + e);
		return;
	}
	
	try{
		String url = "jdbc:mysql://localhost:3306/hospital";
		conn = DriverManager.getConnection(url,"root","123");
		pstmt = conn.prepareStatement("select * from doctor where name = ?");
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		//Thread.sleep(3000);
		while(rs.next()){
		
			result +="{";
			result += "\"name\":" + "\"" + rs.getString("name") + "\",";
			String birth = "19" + rs.getString("birth").substring(0, 2) + "." + rs.getString("birth").substring(2, 4)
					+ "."  + rs.getString("birth").substring(4, 6);
			result += "\"birth\":" + "\"" + birth + "\",";
			result += "\"email\":" + "\"" + rs.getString("email") + "\",";
			String phone = rs.getString("phone").substring(0,3) + "-" + rs.getString("phone").substring(3,7) + 
					"-" + rs.getString("phone").substring(7,11);
			result += "\"phone\":" + "\"" + phone + "\",";
			result += "\"image\":" + "\"" + rs.getString("image") + "\",";
			result += "\"gen\":" + "\"" + rs.getString("gen") + "\"";
			result +="},";
		}
		if(result.length() > 0){
			result = result.substring(0,result.length() -1);
		}
		
		
		out.println(result);
		rs.close();
		pstmt.close();
		conn.close();

	}catch(Exception e){
		System.out.println("doctorDetail 처리실패" + e);
		return;
	}
	%>
]
}