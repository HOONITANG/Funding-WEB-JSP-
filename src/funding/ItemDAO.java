package funding;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ItemDAO {
	String uploadDir = "C:\\Users\\hooni\\AppData\\Roaming\\SPB_Data\\git\\FundingWeb-JSP1-\\FundingWeb-JSP1-\\WebContent\\data\\";
	
	//아이템 입력한 내용 insert 
	public int itemWrite(HttpServletRequest req) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
			try {
			req.setCharacterEncoding("EUC-KR");
			MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", 
					new DefaultFileRenamePolicy());
			String sql = "insert into item_funding values (?, ?, 0, 0, ?, ?, ?, null,?, now())";
			
			//**************date
			
			java.util.Date utilDate = new SimpleDateFormat("MM/dd/yyyy").parse(multi.getParameter("item_day"));
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		    //
		    
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			if (multi.getFilesystemName("item_picture_name") == null) {
				pstmt.setString(1, "ready.gif");
			} else {
				pstmt.setString(1, multi.getFilesystemName("item_picture_name"));
			}
			pstmt.setString(2, multi.getParameter("item_title"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("item_goal_money")));
			
			//**************date
			pstmt.setDate(4, sqlDate);
			
			pstmt.setString(5, multi.getParameter("item_content"));
			pstmt.setString(6, multi.getParameter("user_id"));
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	// 입력한 내용 전체 반환 
	public Vector<ItemDTO> getItemList() {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<ItemDTO> itemlist = new Vector<ItemDTO>();
		try {
			String sql = "Select * from item_funding";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO item = new ItemDTO();
				Date date = new Date(0);
			
				item.setItem_picture_name(rs.getString(1));
				item.setItem_title(rs.getString(2));
				item.setItem_people(rs.getInt(3));
				item.setItem_money(rs.getInt(4));
				item.setItem_goal_money(rs.getInt(5));
				item.setItem_remain_time(rs.getString(6));
				
				item.setItem_content(rs.getString(7));
				item.setItem_id(rs.getInt(8));
				item.setUserid(rs.getString(9));
				item.setItem_enroll_date(rs.getString(10));
				
				//DB에서 받아온 date형 string 형으로 변경 
//				date = rs.getDate(10);
//				DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
//				String enroll_date = df.format(date);
//				item.setItem_enroll_date(enroll_date);
				
				itemlist.add(item);	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return itemlist;
	}
	
	//남은 날짜 계산해서 반환하기
	public String getRemainDate(int itemId) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "에러";
	try {	
		String sql = "SELECT DATEDIFF(`funding_remain_time`,now()) FROM item_funding where funding_id = ?";
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, itemId);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			result = rs.getString(1);
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return result;
	}
	
	// 클릭한 글 상세보기
	public ItemDTO itemShow(int itemId) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemDTO item = new ItemDTO();
		try {
			String sql = "Select * from item_funding where funding_id = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				item.setItem_picture_name(rs.getString(1));
				item.setItem_title(rs.getString(2));
				item.setItem_people(rs.getInt(3));
				item.setItem_money(rs.getInt(4));
				item.setItem_goal_money(rs.getInt(5));
				item.setItem_remain_time(rs.getString(6));
				item.setItem_content(rs.getString(7));
				item.setItem_id(rs.getInt(8));
				item.setUserid(rs.getString(9));
				item.setItem_enroll_date(rs.getString(10));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return item;
	}
	
	// 클릭한 글 수정하기
	public int itemUpdate(HttpServletRequest req) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
	
		try {
			String sql = "update item_funding set funding_picture_name = ?, funding_title = ?, funding_goal_money = ?, funding_content = ?, funding_remain_time = ? where funding_id = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			req.setCharacterEncoding("EUC-KR");
			
			MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "euc-kr", 
					new DefaultFileRenamePolicy());
			
			//**************date
			java.util.Date utilDate = new SimpleDateFormat("MM/dd/yyyy").parse(multi.getParameter("item_day"));
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		    //
			//원래 존재하는 파일 삭제
			int itemId = Integer.parseInt(multi.getParameter("item_id"));
			String filename = getPicName(itemId);
			File file = new File(uploadDir+filename);
			if(file.exists()) {
				file.delete();
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			// 새로운 파일 추가			
			if (multi.getFilesystemName("item_picture_name") == null) {
				pstmt.setString(1, "ready.gif");
			} else {
				pstmt.setString(1, multi.getFilesystemName("item_picture_name"));
			}
			pstmt.setString(2, multi.getParameter("item_title"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("item_goal_money")));
			pstmt.setString(4, multi.getParameter("item_content"));
			//date
			pstmt.setDate(5, sqlDate);
			pstmt.setString(6, multi.getParameter("item_id"));
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	// 클릭한 클 삭제하기
	public int itemDelete(int itemId) {
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		int result = 0;
		String filename = getPicName(itemId);
	
		try {
			String sql = "delete from item_funding where funding_id = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,itemId);
			result = pstmt.executeUpdate();
			
			File file = new File(uploadDir+filename);
			if(file.exists()) {
				file.delete();
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}
	
	//사진 파일명 받아오기
	public String getPicName(int itemId) {
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		try {
			String sql = "select funding_picture_name from item_funding where funding_id = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return result;
	}
	
	// 유저 아이디 받아오기
	public String getUserId(int itemId) {
		Connection con = null;
		DBConnectionMgr pool = new DBConnectionMgr();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;
		try {
			String sql = "select userid from item_funding where funding_id = ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return result;
	}
}
