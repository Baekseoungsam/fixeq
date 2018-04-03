package users.vo;


public class MemberBean {
	
	private Integer idx;
	private String userid;
	private String userpw;
	private String name;
	private String email;
	private String reg_dt;
	
	
	
	public Integer getIdx() {
		return idx;
	}



	public void setIdx(Integer idx) {
		this.idx = idx;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getUserpw() {
		return userpw;
	}



	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getReg_dt() {
		return reg_dt;
	}



	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}



	@Override
	public String toString() {
		return "MemberBean [idx=" + idx + ", userid=" + userid + ", userpw=" + userpw + ", name=" + name + ", email="
				+ email + ", reg_dt=" + reg_dt + "]";
	}
	
}
