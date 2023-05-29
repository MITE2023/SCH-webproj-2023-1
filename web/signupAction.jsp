<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userPW2"/>
<jsp:setProperty name="user" property="userNickname"/>

<head>
    <meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
    <title>JSP BBS</title>
</head>
<body>
<%
    // -1 : DB , -2 : ID, -3 : PW, -4 : Nickname
    if (user.getUserID() == null || user.getUserPW() == null || user.getUserPW2() == null
            || user.getUserNickname() == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('모든 문항을 입력해주세요.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 보냄
        script.println("</script>");
    } else {
        UserDAO userDAO = new UserDAO();
        int result = userDAO.register(user);
        if (result == -1) { // 회원가입 실패시
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DataBase 오류입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }

        else if (result == -3) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('패스워드를 확인해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }

        else if (result == -4) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 닉네임입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");

        }
        else { // 회원가입 성공시
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
        }
    }
%>

</body>
</html>