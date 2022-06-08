package com.boribob.dto;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String post;
	private String roadAddress;	
	private String detailAddress;
	private String phone;
	
	public MemberDTO() {}
	public MemberDTO(String id, String password, String name, String roadAddress, String post, String detailAddress,
			String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.post = post;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.phone = phone;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}	
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", post=" + post
				+ ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress + ", phone=" + phone + "]";


	}
}
