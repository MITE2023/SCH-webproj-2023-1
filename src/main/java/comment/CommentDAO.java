package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CommentDAO {
    private Connection conn;
    private ResultSet rs;

    public CommentDAO() {
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
        }catch(Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int getNext() {
        String SQL = "SELECT comment_id FROM comment ORDER BY comment_id DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return 1;
    }

    public int write(String commentContext, int imgNo, int userNo, int postNo) {
        String SQL = "INSERT INTO comment (comment_context, img_no, user_no, post_no, comment_date) VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, commentContext);
            pstmt.setInt(2, imgNo);
            pstmt.setInt(3, userNo);
            pstmt.setInt(4, postNo);
            pstmt.setString(5, getDate());
            pstmt.executeUpdate();
            return getNext();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public String getUpdateComment(int commentID) {
        String SQL = "SELECT comment_context FROM comment WHERE comment_id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, commentID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public ArrayList<Comment> getList(int postNo) {
        String SQL = "SELECT * FROM comment WHERE post_no = ? ORDER BY comment_no DESC";
        ArrayList<Comment> list = new ArrayList<Comment>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_no(rs.getInt(1));
                comment.setComment_context(rs.getString(2));
                comment.setImg_no(rs.getInt(3));
                comment.setLike_no(0);
                comment.setUser_no(rs.getInt(5));
                comment.setPost_no(rs.getInt(6));
                comment.setComment_date(rs.getString(7));
                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(list.size());
        return list;
    }

    public int update(int commentNo, String commentContext) {
        String SQL = "UPDATE comment SET commentText = ? WHERE commentID LIKE ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, commentContext);
            pstmt.setInt(2, commentNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public Comment getComment(int postNo) {
        String SQL = "SELECT * FROM comment WHERE post_no = ? ORDER BY comment_no DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,  postNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_no(rs.getInt(1));
                comment.setComment_context(rs.getString(2));
                comment.setImg_no(rs.getInt(3));
                comment.setLike_no(0);
                comment.setUser_no(rs.getInt(5));
                comment.setPost_no(rs.getInt(6));
                comment.setComment_date(rs.getString(7));
                return comment;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int delete(int commentNo) {
        String SQL = "DELETE FROM comment WHERE comment_no = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, commentNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}