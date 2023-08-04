package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import goodsList.GoodsListDTO;
import util.DatabaseUtil;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;

	public int join(String userID, String userPassword) {
		String SQL = "INSERT INTO USER VALUES (?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate(); // ?
  
		} catch (Exception e) {
			e.printStackTrace();// 오류
		}

		return -1;
	}

	public boolean ID_Check(String userID) {
		try {
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM user WHERE userID = ?");
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int loginCheck(String id, String pass) {

		PreparedStatement pstmt = null;
		int check = -1;
		try {
			String strQuery = "select userPassword from user where userid = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("userPassword");
				if (pass.equals(dbPass)) {
					check = 1;
				} else {
					check = 0;
				}
			}
		} catch (SQLException s1) {
			s1.printStackTrace();
		}
		return check;
	}

	public ArrayList<UserDTO> getUserList() {
		String SQL = "SELECT * FROM user";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserDTO us = new UserDTO();
				us.setUserID(rs.getString(1));
				us.setUserPassword(rs.getString(2));

				list.add(us);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deleteUserID(String id) {
		PreparedStatement pstmt = null;

		try {
			System.out.println(id);
			String strQuery = "delete from user where userid = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);

			return pstmt.executeUpdate();

		} catch (SQLException s1) {
			s1.printStackTrace();
		}
		return -1;
	}

}
