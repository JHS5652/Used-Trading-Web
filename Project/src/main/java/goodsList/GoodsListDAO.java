package goodsList;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class GoodsListDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;

	public int upload(String userID, String fileName, String subject, String price, String date, String content) {

		String SQL = "INSERT INTO goods VALUES (NULL,?,?,?,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, fileName);
			pstmt.setString(3, subject);
			pstmt.setString(4, price);
			pstmt.setString(5, date);
			pstmt.setString(6, content);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1;

	}

	public ArrayList<GoodsListDTO> getList() {
		String SQL = "SELECT * FROM goods;";
		ArrayList<GoodsListDTO> list = new ArrayList<GoodsListDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GoodsListDTO GL = new GoodsListDTO();

				GL.setNum(rs.getString(1));
				GL.setUserID(rs.getString(2));
				GL.setFileName(rs.getString(3));
				GL.setSubject(rs.getString(4));
				GL.setPrice(rs.getString(5));
				GL.setDate(rs.getString(6));
				GL.setContent(rs.getString(7));
				list.add(GL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<GoodsListDTO> getUserList(String userID) {
		String SQL = "SELECT * FROM goods where userID = ?";

		ArrayList<GoodsListDTO> list = new ArrayList<GoodsListDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsListDTO GL = new GoodsListDTO();
				GL.setNum(rs.getString(1));
				GL.setUserID(rs.getString(2));
				GL.setFileName(rs.getString(3));
				GL.setSubject(rs.getString(4));
				GL.setPrice(rs.getString(5));
				GL.setDate(rs.getString(6));
				GL.setContent(rs.getString(7));
				list.add(GL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public GoodsListDTO getThisGoods(String num) {
		String SQL = "SELECT * FROM goods where num = ?;";

		GoodsListDTO GL = new GoodsListDTO();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				GL.setUserID(rs.getString(2));
				GL.setFileName(rs.getString(3));
				GL.setSubject(rs.getString(4));
				GL.setPrice(rs.getString(5)); 
				GL.setDate(rs.getString(6));
				GL.setContent(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return GL;
	}

	public int setGoodsUpdate(String subject,String price,String date,String content,int num) {
		String SQL = "update goods set subject = ?, price =?, date = ? ,content = ? where num = ?;";

		try {

			System.out.println(content);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, subject);
			pstmt.setString(2, price);
			pstmt.setString(3, date);
			pstmt.setString(4, content);
			pstmt.setInt(5, num);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	} 
	

	public int goodsDelete(String num) {
		String SQL = "delete from goods where num = ?;";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, num);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int goodsDeleteALL(String userID) {
		String SQL = "delete from goods where userID = ?;";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
}
