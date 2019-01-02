package hospital.yeyak;

//의사 스케줄 폼빈
public class DocscBean {

	private int no, busernum; // 처음 공유된 DocscBean 파일에서  'busernum' 과 'busername' 추가
	private String doc_id, date, time, state, busername;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBusernum() {
		return busernum;
	}
	public void setBusernum(int busernum) {
		this.busernum = busernum;
	}
	public String getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getBusername() {
		return busername;
	}
	public void setBusername(String busername) {
		this.busername = busername;
	}
	
	
}

