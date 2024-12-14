package com.chen.pojo;

public class Notice {
	private String id;       	//公告序号
	private String title;		//公告标题
	private String publisher;	//发布人
	private String content;		//公告内容
	private String release_time;	//发布时间
	
	public Notice() {
		
	}
	public Notice(String id, String title, String publisher, String content, String release_time) {
		super();
		this.id = id;
		this.title = title;
		this.publisher = publisher;
		this.content = content;
		this.release_time = release_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRelease_time() {
		return release_time;
	}
	public void setRelease_time(String release_time) {
		this.release_time = release_time;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", publisher=" + publisher + ", content=" + content
				+ ", release_time=" + release_time + "]";
	}
	
	

}
