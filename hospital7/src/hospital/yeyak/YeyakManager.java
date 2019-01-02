package hospital.yeyak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hospital.yeyak.YeyakBean;
import hospital.member.PatientBean;

public class YeyakManager {
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   private DataSource ds;
   
   public YeyakManager() {
      try {
         Context context = new InitialContext();
         //dbcp (pooling 처리)
         ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
      } catch (Exception e) {
         System.out.println("Prac_MemberManager err:" + e);
      }
   }
   /*---------Written by Luke-------------*/
 //예약목록
 	public ArrayList<YeyakdisplayBean> getYeyak(String id) {
 		ArrayList<YeyakdisplayBean> list = new ArrayList<>();
 		try {
 			conn = ds.getConnection();
 			String sql = "select yeyak.no, doctor.name,  hos_dept.name, yeyak.detail, doc_sc.date, doc_sc.time, yeyak.state, yeyak.cost from yeyak \r\n" + 
 					"						inner join doctor on yeyak.doc_id = doctor.id\r\n" + 
 					"								inner join hos_dept on doctor.dept_no = hos_dept.no\r\n" + 
 					"						inner join doc_sc on doc_sc.no = yeyak.sc_no where pat_id = ?;";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, id);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				YeyakdisplayBean bean = new YeyakdisplayBean();
 				bean.setYeyak_no(rs.getInt("yeyak.no"));
 				bean.setDoctor_name(rs.getString("doctor.name"));
 				bean.setHos_dept_name(rs.getString("hos_dept.name"));
 				bean.setDoc_sc_date(rs.getString("doc_sc.date"));
 				bean.setDoc_sc_time(rs.getString("doc_sc.time"));
 				bean.setYeyak_state(rs.getString("yeyak.state"));
 				list.add(bean);
 			}
 		} catch (Exception e) {
 			System.out.println("getYeyak err : " + e);
 		} finally {
 			try {
 				if(rs != null) rs.close();
 				if(pstmt != null) pstmt.close();
 				if(conn != null) conn.close();
 			}catch (Exception e2) {
 				System.out.println("DB close err:" + e2);
 			}
 		}		
 		return list;
 	}
   
   public ArrayList<YeyakBean> getYeyakAll(){
      ArrayList<YeyakBean> list = new ArrayList<>();
      try {
         conn = ds.getConnection();
         String sql = "select * from yeyak order by no desc";   //최근 예약부터
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            YeyakBean bean = new YeyakBean();
            bean.setNo(rs.getInt("no"));
            bean.setDept_no(rs.getInt("dept_no"));
            bean.setSc_no(rs.getInt("sc_no"));
            bean.setCost(rs.getInt("cost"));   
            bean.setPat_id(rs.getString("pat_id"));
            bean.setDoc_id(rs.getString("doc_id"));
            bean.setDetail(rs.getString("detail"));
            bean.setState(rs.getString("state"));
            list.add(bean);      
         }
      } catch (Exception e) {
         System.out.println("getYeyakAll err : " + e);
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
   
   
   //***------------------added by Luke at 09/21 16:55------------***//
   
	//예약상세
	public YeyakdisplayBean getYeyakDetail(String id, String num) {
		YeyakdisplayBean bean = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select yeyak.no, doctor.name,  hos_dept.name, yeyak.detail, doc_sc.date, doc_sc.time, yeyak.state, yeyak.cost from yeyak \r\n" + 
					"						inner join doctor on yeyak.doc_id = doctor.id\r\n" + 
					"								inner join hos_dept on doctor.dept_no = hos_dept.no\r\n" + 
					"						inner join doc_sc on doc_sc.no = yeyak.sc_no where pat_id = ? and  yeyak.no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new YeyakdisplayBean();
				bean.setYeyak_no(rs.getInt("yeyak.no"));
				bean.setDoctor_name(rs.getString("doctor.name"));
				bean.setHos_dept_name(rs.getString("hos_dept.name"));
				bean.setDoc_sc_date(rs.getString("doc_sc.date"));
				bean.setDoc_sc_time(rs.getString("doc_sc.time"));
				bean.setYeyak_state(rs.getString("yeyak.state"));
				bean.setDetail(rs.getString("detail")); 
				bean.setYeyak_cost(rs.getInt("yeyak.cost"));
			}
			
		} catch (Exception e) {
			System.out.println("getYeyakDetail err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e2) {
				System.out.println("DB close err:" + e2);
			}
		}		
		return bean;
	}

   
   //***------------------added by Luke at 09/21 16:55------------***//
   
   
   
   public YeyakBean getYeyakDetail(String no) {
      YeyakBean bean = null;
      try {
         conn = ds.getConnection();
         String sql = "select * from yeyak where no=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, no);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            bean = new YeyakBean();
            bean.setNo(rs.getInt("no"));
            bean.setDept_no(rs.getInt("dept_no"));
            bean.setSc_no(rs.getInt("sc_no"));
            bean.setCost(rs.getInt("cost"));   
            bean.setPat_id(rs.getString("pat_id"));
            bean.setDoc_id(rs.getString("doc_id"));
            bean.setDetail(rs.getString("detail"));
            bean.setState(rs.getString("state"));
         }
      } catch (Exception e) {
         System.out.println("getYeyakDetail err : " + e);
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
   
   public boolean updateYeyak(String no, String state) {
      boolean b = false;
      try {
         conn = ds.getConnection();
         String sql = "update yeyak set state=? where no=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, state);
         pstmt.setString(2, no);
         if(pstmt.executeUpdate() > 0) b = true;
      } catch (Exception e) {
         System.out.println("updateYeyak err : " + e);
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
   
   public boolean deleteYeyak(String no) {
      boolean b = false;
      try {
         conn = ds.getConnection();
         String sql = "delete from yeyak where no=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, no);
         if(pstmt.executeUpdate() > 0) b = true;
      } catch (Exception e) {
         System.out.println("updateYeyak err : " + e);
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
   /*---------Written by Luke-------------*/
   
   public boolean insertYeyak(int dept_no, String pat_id, String doc_id, int sc_no, String detail) {
	      boolean b = false;
	      try {
	         conn = ds.getConnection();
	         String sql = "insert into yeyak(dept_no, pat_id, doc_id, sc_no, detail, state)"
	         		+ " values(?,?,?,?,?,?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, dept_no);
	         pstmt.setString(2, pat_id);
	         pstmt.setString(3, doc_id);
	         pstmt.setInt(4, sc_no);
	         pstmt.setString(5, detail);
	         pstmt.setString(6, "1");
	         if(pstmt.executeUpdate() > 0) b = true;
	      } catch (Exception e) {
	         System.out.println("updateYeyak err : " + e);
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