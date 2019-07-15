package board2;

import java.sql.Date;

public class BoardBean2 {
	    private int num;
	    private String name;
		private String pass;
		private String subject;
		private String content;
	    private int readcount;
	    private Date date;	
	    private String file;
	

		
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



		public void setdate(String string) {
			
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		}
