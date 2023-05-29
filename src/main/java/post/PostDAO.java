package post;

import java.sql.*;
import java.util.ArrayList;

public class PostDAO {
    private Connection conn;
    private ResultSet rs;

    public PostDAO() {
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

    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""; // DB error
    }

    public int getNext() {
        String SQL = "SELECT post_no FROM post ORDER BY post_no DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int write(Post post, int userNo) { // TODO : user NO 어떻게?
        System.out.println(post.getPost_title());
        String SQL = "INSERT INTO post (post_category, post_title, post_code, post_context, user_no, post_date) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "1"); // TODO : 카테고리 분류
            pstmt.setString(2, post.getPost_title());
            pstmt.setString(3, post.getPost_code());
            pstmt.setString(4, post.getPost_context());
            pstmt.setInt(5, userNo);
            pstmt.setString(6, getDate());
            return pstmt.executeUpdate(); // TODO : 230530;1225; 업로드까지 구현
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB error
    }

    public ArrayList<Post> getList(int pageNumber) {
        String SQL = "SELECT * FROM post WHERE post_no < ? ORDER BY post_no DESC LIMIT 10";
        ArrayList<Post> list = new ArrayList<Post>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_no(rs.getInt(1));
                post.setPost_category(rs.getString(2));
                post.setPost_title(rs.getString(3));
                post.setPost_code(rs.getString(4));
                post.setPost_context(rs.getString(5));
                post.setImg_no(rs.getInt(6));
                post.setUser_no(rs.getInt(7));
                post.setComment_no(8);
                post.setPost_date(rs.getString(9));
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM post WHERE post_no < ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
