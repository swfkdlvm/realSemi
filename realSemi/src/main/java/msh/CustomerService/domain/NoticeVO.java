package msh.CustomerService.domain;

public class NoticeVO {
	
	private int rno;
	private int seq;  
	private String subject;
	private String content;
	private String pw;
	private int readcount; 
	private String regdate;
	
	private String prev_seq;
	private String prev_subject;
	private String next_seq;
	private String next_subject;
	
	public String getPrev_seq() {
		return prev_seq;
	}

	public void setPrev_seq(String prev_seq) {
		this.prev_seq = prev_seq;
	}

	public String getPrev_subject() {
		return prev_subject;
	}

	public void setPrev_subject(String prev_subject) {
		this.prev_subject = prev_subject;
	}

	public String getNext_seq() {
		return next_seq;
	}

	public void setNext_seq(String next_seq) {
		this.next_seq = next_seq;
	}

	public String getNext_subject() {
		return next_subject;
	}

	public void setNext_subject(String next_subject) {
		this.next_subject = next_subject;
	}

	public NoticeVO (){}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public NoticeVO(int rno, int seq, String subject, String content, String pw, int readcount, 
			String regdate, String prev_seq, String prev_subject, String next_seq, String next_subject) {
		super();
		this.rno = rno;
		this.seq = seq;
		this.subject = subject;
		this.content = content;
		this.pw = pw;
		this.readcount = readcount;
		this.regdate = regdate;
		this.prev_seq = prev_seq;
		this.prev_subject = prev_subject;
		this.next_seq = next_seq;
		this.next_subject = next_subject;
	}

	
	
	
	
	
}
