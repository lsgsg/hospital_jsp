package hospital.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DoctorManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public DoctorManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
			
		} catch (Exception e) {
			System.out.println("MemberManager err:" + e);
		}
	}
	
	//모든 의사 리스트
	public ArrayList<DoctorBean> getDoctorAll(){
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doctor order by dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorAll err:" + e);
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
	
	//승인 안된 리스트
	public ArrayList<DoctorBean> getDoctorFalse(){
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doctor where ok = 'F' order by dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorFalse err:" + e);
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
	
	//승인된 리스트
	public ArrayList<DoctorBean> getDoctorTrue(){
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doctor where ok = ? order by dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "T");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorTrue err:" + e);
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
	
	/*-----------부서정보 결합------------*/
	//기범 메소드
	public ArrayList<DoctorBean> getDoctordeptAll(){
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doc_sc inner join doctor on doc_id = id inner join hos_dept on hos_dept.no = dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
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
	
	/*-----------부서정보 결합------------*/
	
	
	//해당 과 의사 리스트
	public ArrayList<DoctorBean> getDoctorDept(String dept_no){
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doctor where dept_no = ? and ok = ?";
			//의사 테이블엔 dept 이름이 아닌 no만 있기 때문에, join을 하지 않는 한 dept_no로 걸러내야 함.
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_no);
			pstmt.setString(2, "T");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorDept err:" + e);
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
	
	//해당 과의 해당 의사 bean
	public DoctorBean getDoctorDeptName(String dept_no, String name){
		DoctorBean bean = new DoctorBean();
		
		try {
			String sql = "select * from doctor where dept_no = ? and name = ? and ok = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_no);
			pstmt.setString(2, name);
			pstmt.setString(3, "T");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));	
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorDeptName err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		return bean;
	}
	
	//해당 이름의 의사 bean
	public DoctorBean getDoctorName(String name){
		DoctorBean bean = new DoctorBean();
		
		try {
			String sql = "select * from doctor where name = ? and ok = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, "T");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));	
			}
			
		} catch (Exception e) {
			System.out.println("getDoctorName err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		return bean;
	}
	
	//해당 아이디의 의사 bean
		public DoctorBean getDoctorId(String id){
			DoctorBean bean = new DoctorBean();
			
			try {
				String sql = "select * from doctor where id = ? and ok = ?";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "T");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bean.setId(rs.getString("id"));
					bean.setPasswd(rs.getString("passwd"));
					bean.setDept_no(rs.getInt("dept_no"));
					bean.setName(rs.getString("name"));
					bean.setBirth(rs.getInt("birth"));
					bean.setEmail(rs.getString("email"));
					bean.setGen(rs.getString("gen"));
					bean.setPhone(rs.getString("phone"));
					bean.setZipcode(rs.getString("zipcode"));
					bean.setAddress(rs.getString("address"));
					bean.setImage(rs.getString("image"));	
				}
				
			} catch (Exception e) {
				System.out.println("getDoctorId err:" + e);
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();				
				} catch (Exception e2) {
					System.out.println("DB close err:" + e2);
				}
			}
			return bean;
		}
	
	// 의사 정보 업데이트
	public boolean doctorUpdate(DoctorBean bean, String id) {
		boolean b = false;
		try {
			String sql = "update doctor set passwd = ?, dept_no = ?, "
					+ "email = ?, phone = ?, zipcode = ?, address = ?, "
					+ "image = ? where id = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPasswd());
			pstmt.setInt(2, bean.getDept_no());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getZipcode());
			pstmt.setString(6, bean.getAddress());
			pstmt.setString(7, bean.getImage());
			pstmt.setString(8, id);
			
			if(pstmt.executeUpdate() > 0) {
				b = true;
			}
			
		} catch (Exception e) {
			System.out.println("doctorUpdate err:" + e);
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
	
	public boolean doctorOkUpdate(String id) {
		boolean b = false;
		try {

			String sql = "update doctor set ok = ? where id = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "T");
			pstmt.setString(2, id);
			if(pstmt.executeUpdate() > 0) {
				b = true;
			}
			
		} catch (Exception e) {
			System.out.println("doctorOkUpdate err: " + e);
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
	
	
	public boolean doctorLoginChk(String id, String passwd) {
		boolean b = false;
		try {
			String sql = "select id, passwd from doctor where"
					+ " id = ? and passwd = ? and ok = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, "T");
			rs = pstmt.executeQuery();
			b = rs.next();

		} catch (Exception e) {
			System.out.println("doctorLoginChk err:" + e);
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
	
	public String getFirstDoctor() { //전체 첫번째 의사 얻기
		String doctor = "";
		
		try {
			String sql = "select name from doctor order by dept_no";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) doctor = rs.getString(1);

		} catch (Exception e) {
			System.out.println("getFirstDoctor err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		
		return doctor;
	}
	
	public String getFirstDoctor(String dept_no) { //해당 부서의 첫번째 의사 얻기
		String doctor = "";
		
		try {
			String sql = "select name from doctor where dept_no = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_no);
			rs = pstmt.executeQuery();
			if(rs.next()) doctor = rs.getString(1);

		} catch (Exception e) {
			System.out.println("getFirstDoctor err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}
		
		return doctor;
	}
	
	/*의사 로그인 후 */
	public ArrayList<DoctorBean> getDocIdsel(String docId) {
		ArrayList<DoctorBean> list = new ArrayList<>();
		
		try {
			String sql = "select * from doctor where id = ? ";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				DoctorBean bean = new DoctorBean();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setDept_no(rs.getInt("dept_no"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getInt("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGen(rs.getString("gen"));
				bean.setPhone(rs.getString("phone"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setImage(rs.getString("image"));
				
				list.add(bean);
			}
			
		} catch (Exception e) {
			System.out.println("getDocIdsel err:" + e);
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
	
	//doctor 이름 가지고(페이지 변수) id 구하기
	public String getIdOfDoc(String name) {
		String id = "";
		try {
			String sql = "select id from doctor where name = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
			
		} catch (Exception e) {
			System.out.println("getIdOfDoc err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}		
		
		return id;
	}
	
	//회원가입 기능. 환자회원 추가
	public boolean doctorInsert(DoctorBean bean) {
		boolean b = false;
	    try {
	       conn = ds.getConnection();
	       String sql = "insert into doctor values(?,?,?,?,?,?,?,?,?,?,?,?)";
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setString(1, bean.getId());
	       pstmt.setString(2, bean.getPasswd());
	       pstmt.setInt(3, bean.getDept_no());
	       pstmt.setString(4, bean.getName());
	       pstmt.setInt(5, bean.getBirth());
	       pstmt.setString(6, bean.getEmail());
	       pstmt.setString(7, bean.getGen());
	       pstmt.setString(8, bean.getPhone());
	       pstmt.setString(9, bean.getZipcode());
	       pstmt.setString(10, bean.getAddress());
	       pstmt.setString(11, bean.getImage());
	       pstmt.setString(12, "F");
	       if(pstmt.executeUpdate() > 0) b = true;         
	    } catch (Exception e) {
	       System.out.println("memberInsert err : " + e);
	    }finally {
	       try {
	          if(rs != null) rs.close();
	          if(pstmt != null) pstmt.close();
	          if(conn != null) conn.close();
	       }catch (Exception e2) {
	    	   System.out.println("DB close err:" + e2);
	       }
	    }
	    return b;
	 } 
	
	 //DB에 존재하는 아이디인지 체크. 가입할 때 필요
	 public boolean checkId(String id) {
	    boolean b = false;
	    try {
	       conn = ds.getConnection();
	       String sql = "select id from doctor where id=?";
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
	       }catch (Exception e2) {
	    	   System.out.println("DB close err:" + e2);
	       }
	    }      
	    return b;
	 }
	
}
