package user;

public class User {
    private String userID;
    private String userPW;
    private String userPW2;
    private String userNickname;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPW() {
        return userPW;
    }

    public void setUserPW(String userPW) {
        this.userPW = userPW;
    }

    public String getUserPW2() {
        return userPW2;
    }

    public void setUserPW2(String userPW2) {
        this.userPW2 = userPW2;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

}