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
	
	//������ �Է��� ���� insert 
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
	
	// �Է��� ���� ��ü ��ȯ 
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
				
				//DB���� �޾ƿ� date�� string ������ ���� 
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
	
	//���� ��¥ ����ؼ� ��ȯ�ϱ�
	public String getRemainDate(int itemId) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "����";
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
	
	// Ŭ���� �� �󼼺���
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
	
	// Ŭ���� �� �����ϱ�
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
			//���� �����ϴ� ���� ����
			int itemId = Integer.parseInt(multi.getParameter("item_id"));
			String filename = getPicName(itemId);
			File file = new File(uploadDir+filename);
			if(file.exists()) {
				file.delete();
			} else {
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
			// ���ο� ���� �߰�			
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
	
	// Ŭ���� Ŭ �����ϱ�
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
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}
	
	//���� ���ϸ� �޾ƿ���
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
	
	// ���� ���̵� �޾ƿ���
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
