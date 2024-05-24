package net.notice.db;

import java.util.Date;

public class NoticeBean {
	private int notice_id;
    private String title;
    private String content;
    private Date post_date;
    private String file_name;
    private int read_count;
    
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	@Override
	public String toString() {
		return "NoticeBean [notice_id=" + notice_id + ", title=" + title + ", content=" + content + ", post_date="
				+ post_date + ", file_name=" + file_name + ", read_count=" + read_count + "]";
	}

	
}
