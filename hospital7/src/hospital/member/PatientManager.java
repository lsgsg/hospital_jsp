package hospital.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PatientManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public PatientManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("PatientManager err : " + e);
		}
	}
	
	//DB에 존재하는 아이디인지 체크. 가입할 때 필요
	public boolean checkId(String id) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select id from patient where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			b = rs.next();
		} catch (Exception e) {
			System.out.println("checkId err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
			}
		}		
		return b;
	}
	
	//회원가입 기능. 환자회원 추가
	public boolean memberInsert(PatientBean bean) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getAge());
			pstmt.setInt(5, bean.getMonth());
			pstmt.setInt(6, bean.getDay());
			pstmt.setString(7, bean.getEmail());
			pstmt.setString(8, bean.getGen());
			pstmt.setString(9, bean.getPhone());
			pstmt.setString(10, bean.getZipcode());
			pstmt.setString(11, bean.getAddress());
			pstmt.setString(12, bean.getJob());
			if(pstmt.executeUpdate() > 0) b = true;			
		} catch (Exception e) {
			System.out.println("memberInsert err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
				
			}
		}
		return b;
	}
	
	//로그인 기능. 아이디와 비밀번호를 확인함
	public boolean loginCheck(String id, String passwd) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "select id,passwd from patient where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			b = rs.next();
		} catch (Exception e) {
			System.out.println("loginCheck err : " + e);
		}finally {
			try { 
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
			}
		}
		return b;
	}
	
	//환자 1명의 정보를 불러옴
	public PatientBean getMember(String id) {
		PatientBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from patient where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new PatientBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setAge(rs.getInt("age"));
				bean.setMonth(rs.getInt("month"));
				bean.setDay(rs.getInt("day"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			System.out.println("getMember err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
			}
		}
		return bean;
	}
	
	//환자 1명의 정보를 업데이트함
	public boolean memberUpdate(PatientBean bean) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update patient set name=?,age=?,month=?,day=?,email=?,phone=?,zipcode=?,address=?,job=? where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getAge());
			pstmt.setInt(3, bean.getMonth());
			pstmt.setInt(4, bean.getDay());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getPhone());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getJob());
			pstmt.setString(10, bean.getId());
			pstmt.setString(11, bean.getPasswd());
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberUpdate err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
			}
		}
		return b;
	}
	
	public ArrayList<ZipcodeBean> zipRead(String p_area3){
		ArrayList<ZipcodeBean> list=new ArrayList<>();

		try {
			conn=ds.getConnection();
			String sql="select * from ziptab where area3 like ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p_area3+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean=new ZipcodeBean();
				bean.setZipcode(rs.getString("zipcode"));
				bean.setArea1(rs.getString("area1"));
				bean.setArea2(rs.getString("area2"));
				bean.setArea3(rs.getString("area3"));
				bean.setArea4(rs.getString("area4"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("zipRead err: "+e);
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}

}
