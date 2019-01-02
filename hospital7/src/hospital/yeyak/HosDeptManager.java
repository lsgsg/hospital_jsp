package hospital.yeyak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HosDeptManager {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public HosDeptManager() {
		try {
			Context context = new InitialContext();
			//dbcp (pooling 처리)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HosDeptManager err : " + e);
		}
	}
	
	public ArrayList<HosDeptBean> getHosDeptAll() {
		ArrayList<HosDeptBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from hos_dept";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HosDeptBean bean = new HosDeptBean();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getHosDeptAll err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		return list;
	}
	
	public String getDeptno(String dept) { //부서 이름 가지고 부서 번호 구하기
		String dept_no = "";
		try {
			conn = ds.getConnection();
			String sql = "select no from hos_dept where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept);
			rs = pstmt.executeQuery();
			
			if(rs.next()) dept_no = rs.getString("no");
			
		} catch (Exception e) {
			System.out.println("getDeptno err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		
		return dept_no;
	}
	
	public String getDeptName(String dept_no) { //부서 번호 가지고 부서 이름 구하기
		String dept = "";
		try {
			conn = ds.getConnection();
			String sql = "select name from hos_dept where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) dept = rs.getString("name");
			
		} catch (Exception e) {
			System.out.println("getDeptName err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		
		return dept;
	}
		
	}
