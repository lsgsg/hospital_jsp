package hospital.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private int tot;	//전체 레코드 순위
	private int pList = 10;	//각 페이지 당 출력 레코드 수
	private int pageSu;	//전체 페이지 수
	
	public QnaManager() {
		try {
			Context context = new InitialContext();
			//jndi : dbcp pooling (database connection pooling - pooling 처리)
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("BoardManager err:" + e);
		}
	}
	
	//새글 등록 위해 가장 큰 번호 필요		//try-catch 벗어나려면 mybatis 쓰면 됨	//메소드의 사용은 한계가 있고, 알고리즘이 중요함
	public int currentGetMaxNum() {
		String sql = "select max(num) from qna";
		int cnt = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1);	//rs.next() record pointer
		} catch (Exception e) {
			System.out.println("currentGetMaxNum err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		} 
		return cnt;
	}
	
	public void saveData(QnaBean bean) {
		String sql = "insert into qna values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			//System.out.println(bean.getName());
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0);	//Readcnt는 초기치로 0준다.
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, 0);	//onum
			pstmt.setInt(12, 0);	//nested
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			System.out.println("saveData err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//int page, String stype, String sword 이거 하는 이유?
	public ArrayList<QnaDto> getDataAll(int page, String stype, String sword){	//<BoardDto> generic : 배열에 들어갈 타입 제한이 목적
		ArrayList<QnaDto> list = new ArrayList<>();
		String sql = "select * from qna";
		
		try {
			conn = ds.getConnection();
			
			if(sword == null) {
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else {	//검색
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}			
			rs = pstmt.executeQuery();
			
			for(int i = 0; i < (page - 1) * pList; i++) {
				rs.next(); 	// 0, 4, 9,...
			}
			int k = 0;			
			while(rs.next() && k < pList) {
				QnaDto dto = new QnaDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getDataAll err:" + e);
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
	
	public void totalList() {
		String sql = "select count(*) from qna";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);	//전체 레코드 수
			
		} catch (Exception e) {
			System.out.println("totalList err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public int getPageSu() {	//전체 페이지 수 얻기
		pageSu = tot / pList;
		if(tot % pList > 0) pageSu++;	//자투리 계산
		return pageSu;
	}
	
	public QnaDto getData(String num) {

		String sql = "select * from qna where num=?";
		QnaDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new QnaDto();
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setMail(rs.getString("mail"));
				dto.setTitle(rs.getString("title"));
				dto.setCont(rs.getString("cont"));
				dto.setBip(rs.getString("bip"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));	//조회수
			}
			
		} catch (Exception e) {
			System.out.println("getData err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
		return dto;
	}
	
	public void updateReadcnt(String num) {//글 내용 보기 전에 조회수 증가
		String sql = "update qna set readcnt = readcnt + 1 where num =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
	}

	//댓글용
	public QnaDto getReplyData(String num) {	//BoardDto 왜 이타입으로?

		String sql = "select * from qna where num=?";
		QnaDto dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new QnaDto();
				dto.setTitle(rs.getString("title"));
				dto.setGnum(rs.getInt("gnum"));
				dto.setOnum(rs.getInt("onum"));
				dto.setNested(rs.getInt("nested"));
			}
			
		} catch (Exception e) {
			System.out.println("getData err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
		return dto;
	}
	
	//댓글용
	public void updateOnum(int gnum, int onum) {
		//같은 그룹의 레코드는 모두 작업에 참여
		//같은 그룹의 onum값 변경
		//댓글의 onum은 이미 db에 있는 onum보다 크거나 같은 값을 변경
		String sql = "update qna set onum=onum + 1 where onum >=? and gnum=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onum);
			pstmt.setInt(2, gnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateOnum err:" + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
	}
	
	//댓글 저장용
	public void saveReplyData(QnaBean bean) {
		String sql = "insert into qna values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			//System.out.println(bean.getName());
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0);	//Readcnt(조회수)는 초기치로 0준다.
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, bean.getOnum());	//추가된 onum
			pstmt.setInt(12, bean.getNested());	//추가된 nested
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			System.out.println("saveReplyData err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//수정에서 비밀번호 비교
	public boolean checkPass(int num, String new_pass) {
		boolean b = false;
		String sql = "select pass from qna where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(new_pass.equals(rs.getString("pass"))) b = true;
			}			
		} catch (Exception e) {
			System.out.println("checkPass err: " + e);
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

	public void editData(QnaBean bean) {
		String sql = "update qna set name=?, mail=?, title=?, cont=? where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getMail());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getCont());
			pstmt.setInt(5, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("editData err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
	}
	
	public void delData(String num) {
		String sql = "delete from qna where num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delData err: " + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
	}

}
