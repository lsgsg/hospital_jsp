package hospital.yeyak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DocscManager {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	//생성자, 연결
	public DocscManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("DocscManager err:" + e);
		}
	}
	
/*-----------부서정보 결합------Written by Luke-------------*/
	
	public ArrayList<DocscBean> getDoctordeptAll(){
		ArrayList<DocscBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doc_sc inner join doctor on doc_id = id inner join hos_dept on hos_dept.no = dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DocscBean bean = new DocscBean();
				bean.setNo(rs.getInt("doc_sc.no"));
				bean.setDoc_id(rs.getString("doc_id"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));
				bean.setState(rs.getString("state"));
				bean.setBusernum(rs.getInt("hos_dept.no"));
				bean.setBusername(rs.getString("hos_dept.name"));
						
		
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDoctordeptAll err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		
		return list;
	}
	
	/*-----------부서정보 결합------Written by Luke-------------*/
	
	//의사스케줄 전체 읽기
	public ArrayList<DocscBean> getDocscheduleAll() {
		
		ArrayList<DocscBean> list = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from doc_sc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DocscBean bean = new DocscBean();
				bean.setNo(rs.getInt("no"));
				bean.setDoc_id(rs.getString("doc_id"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));
				bean.setState(rs.getString("state"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getDocscheduleAll err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		} return list;
	}
	
	//의사별 스케줄 읽기
	public DocscBean getDocSchedule(String no) {
		DocscBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from doc_sc where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new DocscBean();
				bean.setNo(rs.getInt("no"));
				bean.setDoc_id(rs.getString("doc_id"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));
				bean.setState(rs.getString("state"));		
			}
		} catch (Exception e) {
			System.out.println("getDocSchedule err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		} return bean;
	}
	
	//예약확인 후 예약확정
	public boolean confirmSchedule(String doc_id, String date, String time) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update doc_sc set state = ? where doc_id = ? and date = ? and time = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "T");
			pstmt.setString(2, doc_id);
			pstmt.setString(3, date);
			pstmt.setString(4, time);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("confirmSchedule err:" + e);
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
	
	//예약취소
	public boolean cancelSchedule(String no) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update doc_sc set state=? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "F");
			pstmt.setString(2, no);
			/*pstmt.setString(2, );
			pstmt.setString(3, );
			pstmt.setString(4, );*/
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("cancelSchedule err:" + e);
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
	
	//예약 수정은 예약취소 -> 예약확인 후 예약확정 메소드 순서로
	
	//해당 날짜와 시간에 예약 되어 있는지 확인
	public boolean ifScheduleOnTime(String doc_id, String date, String time) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select state from doc_sc where doc_id = ? and date = ? and time = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doc_id);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("state").equals("T")) {
					b = true;
				}
			}
			
		} catch (Exception e) {
			System.out.println("ifScheduleOnTime err:" + e);
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
		
	//날짜와 시간으로 doc_sc 번호(no)얻기
	public int getDocScNo(String date, String time) {
		int no = 0;
		try {
			conn = ds.getConnection();
			String sql = "select no from doc_sc where date = ? and time = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, time);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				no = rs.getInt("no");
			}
		} catch (Exception e) {
			System.out.println("getDocScNo err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		} 
		return no;
	}
	
	
		
}
