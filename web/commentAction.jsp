<%@ page import="post.PostDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    UserDAO userDAO = new UserDAO();
    PostDAO postDAO = new PostDAO();
    CommentDAO commentDAO = new CommentDAO();

    String commentContext = request.getParameter("write_comment");
    String userName = (String) session.getAttribute("userID");
    int userNo = userDAO.getNoByUserId(userName);
    String postNo = (String) request.getParameter("postNo");
    String category = (String) request.getParameter("category");
    int imgNo = 0;

    int result = commentDAO.write(commentContext, userNo, postNo);

//    commentDAO.write(session.getAttribute("add_comment"), 0, )
//        public int write(String commentContext, int imgNo, int userNo, int postNo) {

%>

<script>
    // history.back();
    location.href = "viewContent.jsp?postNo=<%=postNo%>&category=<%=category%>";
</script>
<%= commentContext %>
<%= imgNo %>
<%= userNo %>
<%= postNo %>
