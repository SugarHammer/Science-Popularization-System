package com.chen.pojo;

public class Admin {
	private String name;  //用户名
	private String pwd;   //密码
	private String address;  //地址
	private String email;  //用户邮箱
	private String phone;  //电话
	
	public Admin() {
		
	}
	public Admin(String name, String pwd, String address, String email, String phone) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.address = address;
		this.email = email;
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Admin [name=" + name + ", pwd=" + pwd + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ "]";
	}
	
	

}
