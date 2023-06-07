<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("userId");
    String userNickname = request.getParameter("userNickname");

    UserDAO userDAO = new UserDAO();
    String password = userDAO.findPw(userId, userNickname);

    if (password == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력하신 내용과 일치하는 계정이 존재하지 않습니다.')");
        script.println("history.back()");   //이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
%>

<html>
    <title>패스워드 찾기</title>
    <main>
        <h1><%=userNickname%>님의 비밀번호는 <%=password%> 입니다.</h1>
        <h2>보안에 유의하세요.</h2>
    </main>
</html>