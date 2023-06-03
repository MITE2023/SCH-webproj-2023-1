package img;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ImgDAO {
    private Connection conn;
    private ResultSet rs;

    public ImgDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/test";
            String dbID = "root";
            String dbPassword = "root";
            Class.forName("com.mysql.jdbc.Driver");
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getImgUrlByNo(int imgNo) {
        String SQL = "SELECT img_url FROM img WHERE img_no = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, imgNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int addImg(String url, String userNo) {
        String SQL = "INSERT INTO img (img_url, user_no) VALUES(?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, url);
            pstmt.setString(2, userNo);
            pstmt.executeUpdate();
            return getImgNo();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    private int getImgNo() {
        String SQL = "SELECT img_no from img ORDER BY img_no DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            else
                return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
