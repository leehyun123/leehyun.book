package leehyun.book.user.domain;

public class User {
	private String userName;
	private String userId;
	private String password;
	private String birthday;
	private String email;
	private String phoneNum;
	private String answer;
	private String gender;
	private int userNum;
	
	public User() {}
	
	public User(int userNum, String userName, String userId, String password, String birthday, String email, String phoneNum, String answer, String gender) {
		this.userNum = userNum;
		this.userName = userName;
		this.userId = userId;
		this.password = password;
		this.birthday = birthday;
		this.email = email;
		this.phoneNum = phoneNum;
		this.answer = answer;
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public String toString() {
		return String.format("[%s, %s]", userName, password);
	}
}