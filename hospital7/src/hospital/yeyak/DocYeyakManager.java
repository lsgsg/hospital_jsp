package hospital.yeyak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hospital.member.PatientBean;

public class DocYeyakManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public DocYeyakManager() {
		try {
			Context context = new InitialContext();
			//dbcp (pooling 처리)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Prac_MemberManager err:" + e);
		}
	}
	
	//의사의 해당 날짜에 예약된 전체 환자 목록 받아오기
	public ArrayList<DocYeyakBean> getDocSc(String date,String doc_id){
		ArrayList<DocYeyakBean> list=new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select yeyak.no as no," + 
					"patient.name as pat_name," +  
					"patient.id as pat_id," + 
					"patient.age as pat_age," + 
					"patient.gen as pat_gen," + 
					"detail," + 
					"date," + 
					"time," + 
					"yeyak.state as yeyak_state," + 
					"cost " + 
					"from yeyak inner join doc_sc  on doc_sc.no=yeyak.sc_no " + 
					"inner join patient  on pat_id=patient.id " + 
					"where date=? and doc_sc.doc_id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, doc_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DocYeyakBean bean=new DocYeyakBean();
				bean.setNo(rs.getInt("no"));
				bean.setPat_name(rs.getString("pat_name"));
				bean.setPat_id(rs.getString("pat_id"));
				bean.setPat_age(rs.getInt("pat_age"));
				bean.setPat_gen(rs.getString("pat_gen"));
				bean.setDetail(rs.getString("detail"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));	
				switch (rs.getString("yeyak_state")) {
				case "1":
					bean.setYeyak_state("예약완료");
					break;
				case "2":
					bean.setYeyak_state("예약취소");
					break;
				case "3":
					bean.setYeyak_state("예약수정완료");
					break;
				case "4":
					bean.setYeyak_state("진료완료");
					break;
				case "5":
					bean.setYeyak_state("결제완료");
					break;
				default:
					bean.setYeyak_state("예약완료");
					break;
				}
				bean.setCost(rs.getInt("cost"));
				list.add(bean);				
			}
			
		} catch (Exception e) {
			System.out.println("getDocSc err : " + e);
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
	
	//환자의 특정 예약 정보 가져오기
	public DocYeyakBean getYeyak(String yeyak_no){
		DocYeyakBean bean=new DocYeyakBean();
		try {
			conn = ds.getConnection();
			String sql = "select yeyak.no as no," + 
					"patient.name as pat_name," + 
					"patient.id as pat_id," + 
					"patient.age as pat_age," + 
					"patient.gen as pat_gen," + 
					"detail," + 
					"date," + 
					"time," + 
					"yeyak.state as yeyak_state," + 
					"cost " + 
					"from yeyak inner join doc_sc on doc_sc.no=yeyak.sc_no " + 
					"inner join patient on pat_id=patient.id " + 
					"where yeyak.no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, yeyak_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean.setNo(rs.getInt("no"));
				bean.setPat_name(rs.getString("pat_name"));
				bean.setPat_id(rs.getString("pat_id"));
				bean.setPat_age(rs.getInt("pat_age"));
				bean.setPat_gen(rs.getString("pat_gen"));
				bean.setDetail(rs.getString("detail"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));	
				switch (rs.getString("yeyak_state")) {
				case "1":
					bean.setYeyak_state("예약완료");
					break;
				case "2":
					bean.setYeyak_state("예약취소");
					break;
				case "3":
					bean.setYeyak_state("예약수정완료");
					break;
				case "4":
					bean.setYeyak_state("진료완료");
					break;
				case "5":
					bean.setYeyak_state("결제완료");
					break;
				default:
					bean.setYeyak_state("예약완료");
					break;
				}
				bean.setCost(rs.getInt("cost"));
			}
			
		} catch (Exception e) {
			System.out.println("getYeyak err : " + e);
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
	
	//환자의 전체 예약 목록 가져오기
	public ArrayList<DocYeyakBean> getYeyakAll(String pat_id,String doc_id){
		ArrayList<DocYeyakBean> list=new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select yeyak.no as no," + 
					"patient.name as pat_name," + 
					"patient.id as pat_id," + 
					"patient.age as pat_age," + 
					"patient.gen as pat_gen," + 
					"detail," + 
					"date," + 
					"time," + 
					"yeyak.state as yeyak_state," + 
					"cost " + 
					"from yeyak inner join doc_sc on doc_sc.no=yeyak.sc_no " + 
					"inner join patient on pat_id=patient.id " + 
					"where patient.id=? and doc_sc.doc_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pat_id);
			pstmt.setString(2, doc_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DocYeyakBean bean=new DocYeyakBean();
				bean.setNo(rs.getInt("no"));
				bean.setPat_name(rs.getString("pat_name"));
				bean.setPat_id(rs.getString("pat_id"));
				bean.setPat_age(rs.getInt("pat_age"));
				bean.setPat_gen(rs.getString("pat_gen"));
				bean.setDetail(rs.getString("detail"));
				bean.setDate(rs.getString("date"));
				bean.setTime(rs.getString("time"));	
				switch (rs.getString("yeyak_state")) {
				case "1":
					bean.setYeyak_state("예약완료");
					break;
				case "2":
					bean.setYeyak_state("예약취소");
					break;
				case "3":
					bean.setYeyak_state("예약수정완료");
					break;
				case "4":
					bean.setYeyak_state("진료완료");
					break;
				case "5":
					bean.setYeyak_state("결제완료");
					break;
				default:
					bean.setYeyak_state("예약완료");
					break;
				}
				bean.setCost(rs.getInt("cost"));
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
	
	public boolean updateCost(int yeyak_no, int cost) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "update yeyak set cost=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cost);
			pstmt.setInt(2, yeyak_no);
			if(pstmt.executeUpdate()>0) b=true;			
		} catch (Exception e) {
			System.out.println("updateCost err : " + e);
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
