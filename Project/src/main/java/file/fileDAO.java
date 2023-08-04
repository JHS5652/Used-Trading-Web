package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DatabaseUtil;

public class fileDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;


	public int upload(String fileName, String fileRealName) {

		String SQL = "INSERT INTO FILE VALUES (?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1,  fileName);

			pstmt.setString(2,  fileRealName);

			return pstmt.executeUpdate();

		} catch(Exception e) {

			e.printStackTrace();

		}

		return -1;

	}
	
	
}
