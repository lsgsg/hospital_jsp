package hospital.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HosAdminManager {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public HosAdminManager() {
		try {
			Context context = new InitialContext();
			//dbcp (pooling 처리)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HosAdminManager err : " + e);
		}
	}
	
	public boolean hosAdminLoginChk(String id, String passwd) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hos_admin where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			b = rs.next();
			
			
		} catch (Exception e) {
			System.out.println("hosAdminLoginChk err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}	
		return b;
			
		}
		
	}
