package org.kosta.watflix.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String tel;
	private String birth;
	private String sex;
	private String email;
	private String address;
	private String loginTime;
	private int loginFail;
	private int point;
	private String signupDate;
	private String agreement;
	private AccStatusVO accStatusVO;
	private int reportCount;
	public MemberVO() {
		super();
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel + ", birth=" + birth
				+ ", sex=" + sex + ", email=" + email + ", address=" + address + ", loginTime=" + loginTime
				+ ", loginFail=" + loginFail + ", point=" + point + ", signupDate=" + signupDate + ", agreement="
				+ agreement + ", accStatusVO=" + accStatusVO + ", reportCount=" + reportCount + "]";
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




	public String getTel() {
		return tel;
	}




	public void setTel(String tel) {
		this.tel = tel;
	}




	public String getBirth() {
		return birth;
	}




	public void setBirth(String birth) {
		this.birth = birth;
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




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
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




	public int getReportCount() {
		return reportCount;
	}




	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}




	public MemberVO(String id, String password, String name, String tel, String birth, String sex, String email,
			String address, String loginTime, int loginFail, int point, String signupDate, String agreement,
			AccStatusVO accStatusVO, int reportCount) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.sex = sex;
		this.email = email;
		this.address = address;
		this.loginTime = loginTime;
		this.loginFail = loginFail;
		this.point = point;
		this.signupDate = signupDate;
		this.agreement = agreement;
		this.accStatusVO = accStatusVO;
		this.reportCount = reportCount;
	}




	/*
	 * public MemberVO(String id, String password, String name, String tel, String
	 * birth, String sex, String email, String address, String loginTime, int
	 * loginFail, int point, String signupDate, String agreement, AccStatusVO
	 * accStatusVO) { super(); this.id = id; this.password = password; this.name =
	 * name; this.tel = tel; this.birth = birth; this.sex = sex; this.email = email;
	 * this.address = address; this.loginTime = loginTime; this.loginFail =
	 * loginFail; this.point = point; this.signupDate = signupDate; this.agreement =
	 * agreement; this.accStatusVO = accStatusVO; }
	 * 
	 * public String getId() { return id; }
	 * 
	 * public void setId(String id) { this.id = id; }
	 * 
	 * public String getPassword() { return password; }
	 * 
	 * public void setPassword(String password) { this.password = password; }
	 * 
	 * public String getName() { return name; }
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * public String getTel() { return tel; }
	 * 
	 * public void setTel(String tel) { this.tel = tel; }
	 * 
	 * public String getBirth() { return birth; }
	 * 
	 * public void setBirth(String birth) { this.birth = birth; }
	 * 
	 * public String getSex() { return sex; }
	 * 
	 * public void setSex(String sex) { this.sex = sex; }
	 * 
	 * public String getEmail() { return email; }
	 * 
	 * public void setEmail(String email) { this.email = email; }
	 * 
	 * public String getAddress() { return address; }
	 * 
	 * public void setAddress(String address) { this.address = address; }
	 * 
	 * public String getLoginTime() { return loginTime; }
	 * 
	 * public void setLoginTime(String loginTime) { this.loginTime = loginTime; }
	 * 
	 * public int getLoginFail() { return loginFail; }
	 * 
	 * public void setLoginFail(int loginFail) { this.loginFail = loginFail; }
	 * 
	 * public int getPoint() { return point; }
	 * 
	 * public void setPoint(int point) { this.point = point; }
	 * 
	 * public String getSignupDate() { return signupDate; }
	 * 
	 * public void setSignupDate(String signupDate) { this.signupDate = signupDate;
	 * }
	 * 
	 * public String getAgreement() { return agreement; }
	 * 
	 * public void setAgreement(String agreement) { this.agreement = agreement; }
	 * 
	 * public AccStatusVO getAccStatusVO() { return accStatusVO; }
	 * 
	 * public void setAccStatusVO(AccStatusVO accStatusVO) { this.accStatusVO =
	 * accStatusVO; }
	 */

	


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accStatusVO == null) ? 0 : accStatusVO.hashCode());
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((agreement == null) ? 0 : agreement.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + loginFail;
		result = prime * result + ((loginTime == null) ? 0 : loginTime.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + point;
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((signupDate == null) ? 0 : signupDate.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
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
		if (accStatusVO == null) {
			if (other.accStatusVO != null)
				return false;
		} else if (!accStatusVO.equals(other.accStatusVO))
			return false;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (agreement == null) {
			if (other.agreement != null)
				return false;
		} else if (!agreement.equals(other.agreement))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (loginFail != other.loginFail)
			return false;
		if (loginTime == null) {
			if (other.loginTime != null)
				return false;
		} else if (!loginTime.equals(other.loginTime))
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
		if (point != other.point)
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (signupDate == null) {
			if (other.signupDate != null)
				return false;
		} else if (!signupDate.equals(other.signupDate))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		return true;
	}

	
	/*
	 * @Override public String toString() { return "MemberVO [id=" + id +
	 * ", password=" + password + ", name=" + name + ", tel=" + tel + ", birth=" +
	 * birth + ", sex=" + sex + ", email=" + email + ", address=" + address +
	 * ", loginTime=" + loginTime + ", loginFail=" + loginFail + ", point=" + point
	 * + ", signupDate=" + signupDate + ", agreement=" + agreement +
	 * ", accStatusVO=" + accStatusVO + "]"; }
	 */
	
	
}
