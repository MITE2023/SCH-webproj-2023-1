<%@ page import="comment.CommentDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    UserDAO userDAO = new UserDAO();
    CommentDAO commentDAO = new CommentDAO();

    String commentContext = request.getParameter("write_comment");
    String userName = (String) session.getAttribute("userID");
    String postNo = request.getParameter("postNo");
    String category = request.getParameter("category");
    int userNo = userDAO.getNoByUserId(userName);

    commentDAO.write(commentContext, userNo, postNo);

%>

<script>
    location.href = "viewContent.jsp?postNo=<%=postNo%>&category=<%=category%>";
</script>
