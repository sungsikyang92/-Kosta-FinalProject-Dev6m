package org.kosta.watflix.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String birth;
	private String tel;
	private String sex;
	private String email;
	private String loginTime;
	private int loginFail;
	private int point;
	private String signupDate;
	private String agreement;
	private AccStatusVO accStatusVO;
	private int enabled;
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", birth="
				+ birth + ", tel=" + tel + ", sex=" + sex + ", email=" + email + ", loginTime=" + loginTime
				+ ", loginFail=" + loginFail + ", point=" + point + ", signupDate=" + signupDate + ", agreement="
				+ agreement + ", accStatusVO=" + accStatusVO + ", enabled=" + enabled + "]";
	}
	public MemberVO() {
		super();
	}
	
	public MemberVO(String id, String password, String name, String address, String birth, String tel, String sex,
			String email, String agreement) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birth = birth;
		this.tel = tel;
		this.sex = sex;
		this.email = email;
		this.agreement = agreement;
	}
	public MemberVO(String id, String password, String name, String address, String birth, String tel, String sex,
			String email, String loginTime, int loginFail, int point, String signupDate, String agreement,
			AccStatusVO accStatusVO) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birth = birth;
		this.tel = tel;
		this.sex = sex;
		this.email = email;
		this.loginTime = loginTime;
		this.loginFail = loginFail;
		this.point = point;
		this.signupDate = signupDate;
		this.agreement = agreement;
		this.accStatusVO = accStatusVO;
	}
	public MemberVO(String id, String password, String name, String address, String birth, String tel, String sex,
			String email, String loginTime, int loginFail, int point, String signupDate, String agreement,
			AccStatusVO accStatusVO, int enabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birth = birth;
		this.tel = tel;
		this.sex = sex;
		this.email = email;
		this.loginTime = loginTime;
		this.loginFail = loginFail;
		this.point = point;
		this.signupDate = signupDate;
		this.agreement = agreement;
		this.accStatusVO = accStatusVO;
		this.enabled = enabled;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public int getLoginFail() {
		return loginFail;
	}
	public void setLoginFail(int loginFail) {
		this.loginFail = loginFail;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}
	public String getAgreement() {
		return agreement;
	}
	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}
	public AccStatusVO getAccStatusVO() {
		return accStatusVO;
	}
	public void setAccStatusVO(AccStatusVO accStatusVO) {
		this.accStatusVO = accStatusVO;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + enabled;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (enabled != other.enabled)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}
	
	
}
