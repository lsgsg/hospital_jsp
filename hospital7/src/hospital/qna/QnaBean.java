package hospital.qna;
 
import java.util.Calendar;

public class QnaBean {	//FormBean; 레코드단위 데이터 처리를 위한..
	private String name, pass, mail, title, cont, bip, bdate;
	private int num, readcnt, gnum, onum, nested;
	//연산할 거 없으면 int 없어도 됨
	
	/*gnum(6) (group number) = 원글 6번에 대한 댓글군
			onum (order number)= 군 안에서의 순서
			nested = 들여쓰기 칸수 0,1,2,...*/
	
	//method overloading(arg 없는걸로 setter 하나더)
	public void setBdate() {	//작성일
		Calendar calendar = Calendar.getInstance();
		int year= calendar.get(Calendar.YEAR);
		int month= calendar.get(Calendar.MONTH) + 1;
		int day= calendar.get(Calendar.DATE);
		this.bdate = year + "-" + month + "-" + day;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getNested() {
		return nested;
	}
	public void setNested(int nested) {
		this.nested = nested;
	}
}
