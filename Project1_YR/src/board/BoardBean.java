package board;

import java.sql.Date;

public class BoardBean {
	    private int num;
	    private String name;
		private String pass;
		private String subject;
		private String content;
		private int readcount;
	    private Date date;	
	    private String file;
	    private int re_ref;
	    private int re_lev;
	    private int re_seq;
	    private int likeit;

		public int getRe_ref() {
			return re_ref;
		}

		public void setRe_ref(int re_ref) {
			this.re_ref = re_ref;
		}

		public int getRe_lev() {
			return re_lev;
		}

		public void setRe_lev(int re_lev) {
			this.re_lev = re_lev;
		}

		public int getRe_seq() {
			return re_seq;
		}

		public void setRe_seq(int re_seq) {
			this.re_seq = re_seq;
		}

		public String getFile() {
			return file;
		}

		public void setFile(String file) {
			this.file = file;
		}

		public void setName(String sname) { 
			name=sname;
		}

		public String getName(){
			return name;		
		}
		
		public String getPass() {
			return pass;
		}

		public void setPass(String pass) {
			this.pass = pass;
		}
	    
	    
		public String getSubject() {
			return subject;
		}

		public void setSubject(String subject) {
			this.subject = subject;
		}
		

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public void setContent(String content) {
			this.content = content;
		}



		public String getContent() {
			return content;
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}


		public void setdate(String string) {
			
		}

		public int getLikeit() {
			return likeit;
		}

		public void setLikeit(int likeit) {
			this.likeit = likeit;
		}
	}
