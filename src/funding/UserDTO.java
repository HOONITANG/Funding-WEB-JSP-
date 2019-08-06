package funding;

public class UserDTO {
	String userId;
	String userPasswd;
	String userEmail;
	int userCheck;
	int userEmailCheck;
	String userEmailHash;
	
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserCheck() {
		return userCheck;
	}
	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}
	public int getUserEmailCheck() {
		return userEmailCheck;
	}
	public void setUserEmailCheck(int userEmailCheck) {
		this.userEmailCheck = userEmailCheck;
	}
}
