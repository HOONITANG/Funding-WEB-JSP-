package funding;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import util.SHA256;

public class UserDAO {
	private String url;
	private String user;
	private String passwd;
	
	public UserDAO() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			url = "jdbc:mysql://localhost:3306/funding";
			user = "root";
			passwd = "1234";
			
		} catch (Exception e) {
			System.out.println("Exception: "+ e);
		}
	}
	
	//request 객체를 인자로 받아서 회원가입(insert) 처리
	public int userJoin(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into user_join (`userId`,`userPasswd`,`userEmail`,`userEmailHash`) values(?, ?, ?, ?)";
		int result = 0;
		
		try {
			con = DriverManager.getConnection(url,user,passwd);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("userId"));
			pstmt.setString(2, req.getParameter("userPasswd"));
			pstmt.setString(3, req.getParameter("userEmail"));
			pstmt.setString(4, SHA256.getSHA256(req.getParameter("userEmail")));
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Exception: "+ e);
			// TODO: handle exception
		} finally {
			try { pstmt.close(); } catch(Exception e) {}
			try { con.close(); } catch(Exception e) {}
		}
		return result;
	}
	
	//email 처리 인증 시 1, 아닐시 9
	public int getUserEmailChecked(String userID) {
		int result = 0;
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String SQL = "SELECT userEmailCheck FROM user_join where userID = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { result = rs.getInt("userEmailCheck"); }
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception: " + e);
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return result;
	}
	// emailcheck true 설정 
	public int setUserEmailChecked(String userID) {
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		try {
			String SQL = "UPDATE USER_JOIN SET userEmailCheck = 1 WHERE userID = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();	
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return 0; //
	}
	// useremail을 가져오는 함수 
	public String getUserEmail(String userID) {
		
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String SQL = "SELECT userEmail FROM USER_JOIN WHERE userID = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return null; // 나온 값이 없을경우 null 
	}
	
	//userDTO 객체를 인자로 받아서 로그인(select) 처리
	public int userLogin(UserDTO userDTO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int login_check = 99;
		
		try {
			String sql = "select userPasswd from user_join where userId = ?";
			con = DriverManager.getConnection(url,user,passwd);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userDTO.getUserId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				login_check = 0;
				if (rs.getString("userPasswd").equals(userDTO.getUserPasswd())) {
					login_check = 1;
				}
			}
			else {
				login_check = -1;
			}
		} catch (Exception e) {
			System.out.println("Exception: "+ e);
		} finally {
			try { rs.close(); } catch(Exception e) {}
			try { pstmt.close(); } catch(Exception e) {}
			try { con.close(); } catch(Exception e) {}
		}
		
		return login_check;
	}
	
	//userID를 인자로 받아서 중복체크
	public int userIdCheck(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			String sql = "select userId from user_join where userId = ?";
			con = DriverManager.getConnection(url,user,passwd);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception :" + e);
		} finally {
			try { rs.close(); } catch(Exception e) {}
			try { pstmt.close(); } catch(Exception e) {}
			try { con.close(); } catch(Exception e) {}
		}
		
		return result;
	}
	
}
