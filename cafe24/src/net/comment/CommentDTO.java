package net.comment;

public class CommentDTO {
	
	//1) private variables
	 private int conum;
	 private String cname;
	 private String cocontent;
	 private String codate;
	 private int cobbsno;
	
	 //2) Constructor
	 public CommentDTO() {
	}
	
	 //3) Getter & Setter
	public int getConum() {
		return conum;
	}

	public void setConum(int conum) {
		this.conum = conum;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCocontent() {
		return cocontent;
	}

	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}

	public String getCodate() {
		return codate;
	}

	public void setCodate(String codate) {
		this.codate = codate;
	}

	public int getCobbsno() {
		return cobbsno;
	}

	public void setCobbsno(int cobbsno) {
		this.cobbsno = cobbsno;
	}

	@Override
	public String toString() {
		return "CommentDTO [conum=" + conum + ", cname=" + cname + ", cocontent="
				+ cocontent + ", codate=" + codate + ", cobbsno=" + cobbsno
				+ "]";
	}	
}
