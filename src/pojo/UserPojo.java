package pojo;

public class UserPojo {
	
	private String userid;
	private String password;
	private String username;
	private String phone_no ;
	private String address_id;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public UserPojo(String userid, String password, String username, String phone_no) {
		super();
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.phone_no = phone_no;
	}
	public UserPojo(String userid, String password, String username, String phone_no, String address_id) {
		super();
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.phone_no = phone_no;
		this.address_id = address_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}
	public UserPojo() {
		super();
	}
	

}
