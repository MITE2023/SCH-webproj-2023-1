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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int write(Post post, int userNo, int imgNo) { // TODO : user NO 어떻게?
        String SQL = "INSERT INTO post (post_title, post_code, post_context, user_no, post_date, img_no) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, post.getPost_title());
            pstmt.setString(2, post.getPost_code());
            pstmt.setString(3, post.getPost_context());
            pstmt.setInt(4, userNo);
            pstmt.setString(5, getDate());
            pstmt.setInt(6, imgNo - 1);
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
                post.setPost_title(rs.getString(2));
                post.setPost_code(rs.getString(3));
                post.setPost_context(rs.getString(4));
                post.setImg_no(rs.getInt(5));
                post.setUser_no(rs.getInt(6));
                post.setComment_no(7);
                post.setPost_date(rs.getString(8));
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Post> getTitleList(int pageNumber, String searchTitle) {
        String SQL = "SELECT * FROM post WHERE post_no < ? AND post_title " +
                "LIKE '%" + searchTitle.trim() + "%' ORDER BY post_no DESC LIMIT 10";

        ArrayList<Post> list = new ArrayList<Post>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_no(rs.getInt(1));
                post.setPost_title(rs.getString(2));
                post.setPost_code(rs.getString(3));
                post.setPost_context(rs.getString(4));
                post.setImg_no(rs.getInt(5));
                post.setUser_no(rs.getInt(6));
                post.setComment_no(7);
                post.setPost_date(rs.getString(8));
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

    public Post getPost(int postNo) {
        String SQL = "SELECT * FROM post WHERE post_no = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Post post = new Post();
                post.setPost_no(rs.getInt(1));
                post.setPost_title(rs.getString(2));
                post.setPost_code(rs.getString(3));
                post.setPost_context(rs.getString(4));
                post.setImg_no(rs.getInt(5));
                post.setUser_no(rs.getInt(6));
                post.setComment_no(rs.getInt(7));
                post.setPost_date(rs.getString(8));
                return post;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int deletePost(String post_no, String category) {
        String SQL;
        if (category.equals("1")) {
            SQL = "DELETE FROM post WHERE post_no = ?";
        } else SQL = "DELETE FROM trend_post WHERE post_no = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, post_no);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
