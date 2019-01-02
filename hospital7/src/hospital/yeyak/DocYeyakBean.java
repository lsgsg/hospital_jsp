package hospital.yeyak;

public class DocYeyakBean {
		private  int no,dept_no,sc_no,cost;
		private String pat_id,doc_id,detail,yeyak_state;
		private String date,time,sc_state,pat_name,pat_gen;
		private int pat_age;
		
		
		public String getPat_name() {
			return pat_name;
		}
		public void setPat_name(String pat_name) {
			this.pat_name = pat_name;
		}
		public int getPat_age() {
			return pat_age;
		}
		public void setPat_age(int pat_age) {
			this.pat_age = pat_age;
		}
		public String getPat_gen() {
			return pat_gen;
		}
		public void setPat_gen(String pat_gen) {
			this.pat_gen = pat_gen;
		}
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public int getDept_no() {
			return dept_no;
		}
		public void setDept_no(int dept_no) {
			this.dept_no = dept_no;
		}
		public int getSc_no() {
			return sc_no;
		}
		public void setSc_no(int sc_no) {
			this.sc_no = sc_no;
		}
		public int getCost() {
			return cost;
		}
		public void setCost(int cost) {
			this.cost = cost;
		}
		public String getPat_id() {
			return pat_id;
		}
		public void setPat_id(String pat_id) {
			this.pat_id = pat_id;
		}
		public String getDoc_id() {
			return doc_id;
		}
		public void setDoc_id(String doc_id) {
			this.doc_id = doc_id;
		}
		public String getDetail() {
			return detail;
		}
		public void setDetail(String detail) {
			this.detail = detail;
		}
		public String getYeyak_state() {
			return yeyak_state;
		}
		public void setYeyak_state(String yeyak_state) {
			this.yeyak_state = yeyak_state;
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
		public String getSc_state() {
			return sc_state;
		}
		public void setSc_state(String sc_state) {
			this.sc_state = sc_state;
		}
}
