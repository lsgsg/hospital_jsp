package hospital.yeyak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DocScInsertManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public DocScInsertManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("DocScInsertManager err:" + e);
		}
	}
	
	public ArrayList<DocscBean> getDocSc(String date, String id) {
		ArrayList<DocscBean> list=new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select * from doc_sc where date=? and doc_id=? order by time";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DocscBean bean=new DocscBean();
				bean.setNo(rs.getInt("no"));
				bean.setDoc_id(rs.getString("doc_id"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));
				bean.setState(rs.getString("state"));
				list.add(bean);				
			}
		} catch (Exception e) {
			System.out.println("getDocSc err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public boolean changeDSc(String doc_id,String date,String time) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "update doc_sc set state='D' where doc_id=? and date=? and time=?"; //삭제하면 state값을 D로 변경
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doc_id);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			if(pstmt.executeUpdate()>0) b=true;			
		} catch (Exception e) {
			System.out.println("changefSc err:" + e);
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
	
	public boolean changeFSc(String doc_id,String date,String time) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "update doc_sc set state='F' where doc_id=? and date=? and time=?"; //삭제하면 state값을 D로 변경
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doc_id);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			if(pstmt.executeUpdate()>0) b=true;			
		} catch (Exception e) {
			System.out.println("changefSc err:" + e);
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
	
	public boolean insertSc(String doc_id,String date,String time,String state) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "insert into doc_sc(doc_id,date,time,state) values(?,?,?,?)"; //삭제하면 state값을 D로 변경
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doc_id);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			pstmt.setString(4, state);
			if(pstmt.executeUpdate()>0) b=true;			
		} catch (Exception e) {
			System.out.println("insertSc err:" + e);
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
