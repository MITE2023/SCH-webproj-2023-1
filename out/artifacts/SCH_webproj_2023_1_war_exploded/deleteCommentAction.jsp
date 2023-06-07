<%@ page import="comment.CommentDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String commentNo = request.getParameter("commentNo");
    String postNo = request.getParameter("postNo");
    String category = request.getParameter("category");
    CommentDAO commentDAO = new CommentDAO();
%>

<script>
    var result = confirm("댓글을 삭제하시겠습니까?");

    if (result == true) {
        alert('댓글을 삭제합니다.');
        <%commentDAO.delete(commentNo);%>
        location.href = "viewContent.jsp?postNo=<%=postNo%>&category=<%=category%>";
    }
</script>

