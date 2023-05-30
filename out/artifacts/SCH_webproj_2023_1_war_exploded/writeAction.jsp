<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="post.PostDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="post" class="post.Post" scope="page"></jsp:useBean>
<jsp:setProperty name="post" property="post_title"/>
<jsp:setProperty name="post" property="post_context"/>
<jsp:setProperty name="post" property="post_code"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
    <title>JSP BBS</title>
</head>
<body>
<%

    if(session.getAttribute("userID") != null) {
        UserDAO userDAO = new UserDAO();
        String userID = (String) session.getAttribute("userID");
        String userNickname = (String) session.getAttribute("userNickname");

        if (post.getPost_title() == null || post.getPost_context() == null || post.getPost_code() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        } else {
            PostDAO postDAO = new PostDAO();
            int result = postDAO.write(post, userDAO.getNoByUserId(userID)); // TODO : 수정 필요
            PrintWriter script = response.getWriter();
            script.println("<script>");
            if (result == -1) { // 글쓰기 실패시
                script.println("alert('글쓰기에 실패했습니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            } else { // 글쓰기 성공시
                script.println("location.href = 'questionBoard.jsp'");    // 메인 페이지로 이동
            }
            script.println("</script>");
        }

    }

    else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 해주세요.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 보냄
        script.println("</script>");
    }

%>

</body>
</html>