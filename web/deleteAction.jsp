<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.PostDAO" %>

<%
    PostDAO postDAO = new PostDAO();
    String postNo = (String) session.getAttribute("deletePostNo");
    String category = (String) session.getAttribute("deleteCategory");
%>

<script>
    var result = confirm("게시글을 삭제하시겠습니까?");

    if (result == true) {
        alert('게시글을 삭제합니다.');
        <%postDAO.deletePost(String.valueOf(postNo), category);%>
        location.href = 'index.jsp';
    }
</script>

