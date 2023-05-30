package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
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

    public String getNicknameByNo(int userNo) {
        String SQL = "SELECT user_nickname FROM user WHERE user_no = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "null";
    }

    public int getNoByUserId(String userID) {
        String SQL = "SELECT user_no FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    public int login(String userID, String userPassword) {
        String SQL = "SELECT user_pw FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword))
                    return 1;
                else
                    return 0;
            }
            return -1; // id not found
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB error
    }

    public int register(User user) {
        // -1 : DB , -2 : ID, -3 : PW, -4 : Nickname
        if (idValidation(user.getUserID()) == 1) {
            return -2;
        }

        if (pwValidation(user.getUserPW(), user.getUserPW2()) == -1) {
            return -3;
        }

        if (nicknameValidation(user.getUserNickname()) == 1) {
            return -4;
        }

        String SQL = "INSERT INTO user(user_id, user_pw, user_nickname) VALUES (?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPW());
            pstmt.setString(3, user.getUserNickname());
            return pstmt.executeUpdate(); // if return value up to 0 - success
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB error
    }

    // TODO : ID Validation
    private int idValidation(String userID) {
        String SQL = "SELECT COUNT(user_no) FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                System.out.println(count);
                if (count > 0) return 1; // id already exist
                else return -1; // validation pass
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB error
    }

    // TODO : PW Validation
    private int pwValidation(String userPW, String userPW2) {
        if (userPW.equals(userPW2)) {
            return 1; // validation pass
        }
        else return -1; // password is wrong
    }

    // TODO : Nickname Validation
    private int nicknameValidation(String userNickname) {
        String SQL = "SELECT COUNT(user_no) FROM user WHERE user_nickname = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userNickname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) return 1; // nickname already exist
                else return -1; // validation pass
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB error
    }
}
