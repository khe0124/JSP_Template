package net.pds;

public class pdsDTO {

	//1) private variables
	private int pdsno;
	private String wname;
	private String subject;
	private String content;
	private String regdate;
	private String passwd;
	private int readcnt;
	private String filename;
	private long filesize;
	
	
	public pdsDTO(){}

	//2) Getter, Setter
	public int getPdsno() {
		return pdsno;
	}


	public void setPdsno(int pdsno) {
		this.pdsno = pdsno;
	}


	public String getWname() {
		return wname;
	}


	public void setWname(String wname) {
		this.wname = wname;
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


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public long getFilesize() {
		return filesize;
	}


	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	@Override
	public String toString() {
		return "pdsDTO [pdsno=" + pdsno + ", wname=" + wname + ", subject="
				+ subject + ", content=" + content + ", regdate=" + regdate
				+ ", passwd=" + passwd + ", readcnt=" + readcnt + ", filename="
				+ filename + ", filesize=" + filesize + "]";
	}		
}
