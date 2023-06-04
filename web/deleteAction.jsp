<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.PostDAO" %>

<%
    PostDAO postDAO = new PostDAO();
    String category = request.getParameter("category");
    String postNo = request.getParameter("postNo");
    postDAO.deletePost(postNo, category);
%>
<script>
    alert('게시글이 삭제되었습니다.');
    window.location.href('viewContent.jsp');
</script>

