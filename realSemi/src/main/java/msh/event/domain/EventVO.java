package msh.event.domain;

public class EventVO {
	
	private int eventno;  
	private String eventimg;
	private String eventdate;
	private String eventimgdetail;
	private String eventitle;
	
	public String getEventitle() {
		return eventitle;
	}
	public void setEventitle(String eventitle) {
		this.eventitle = eventitle;
	}
	public String getEventimgdetail() {
		return eventimgdetail;
	}
	public void setEventimgdetail(String eventimgdetail) {
		this.eventimgdetail = eventimgdetail;
	}
	public int getEventno() {
		return eventno;
	}
	public void setEventno(int eventno) {
		this.eventno = eventno;
	}
	public String getEventimg() {
		return eventimg;
	}
	public void setEventimg(String eventimg) {
		this.eventimg = eventimg;
	}
	public String getEventdate() {
		return eventdate;
	}
	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}
	
	
	
}
