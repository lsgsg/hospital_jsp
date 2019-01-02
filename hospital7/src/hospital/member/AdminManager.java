package hospital.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public AdminManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("BoardManager err:" + e);
		}
	}
	
	//관리자의 정보를 불러옴.
	public AdminBean getAdmin(String id) {
		AdminBean bean=new AdminBean();
		try {
			conn = ds.getConnection();
			String sql = "select * from hos_admin where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("getAdmin err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bean;
	}
	
	//관리자의 정보를 업데이트함.
	public boolean adminUpdate(AdminBean bean,String id) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "update hos_admin set name=? where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, id);
			pstmt.setString(3, bean.getPasswd());
			if(pstmt.executeUpdate()>0) b=true;
		} catch (Exception e) {
			System.out.println("adminUpdate err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
}
