package comment;

public class Comment {
    private int comment_id;
    private String comment_context;

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_context() {
        return comment_context;
    }

    public void setComment_context(String comment_context) {
        this.comment_context = comment_context;
    }

    public int getImg_no() {
        return img_no;
    }

    public void setImg_no(int img_no) {
        this.img_no = img_no;
    }

    public int getLike_no() {
        return like_no;
    }

    public void setLike_no(int like_no) {
        this.like_no = like_no;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public int getPost_no() {
        return post_no;
    }

    public void setPost_no(int post_no) {
        this.post_no = post_no;
    }

    private int img_no;
    private int like_no;
    private int user_no;
    private int post_no;

}
