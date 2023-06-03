<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="post.PostDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="img.Img" %>
<%@ page import="img.ImgDAO" %>
<%@ page import="post.TrendPostDAO" %>
<%@ page import="post.Post" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
    <title>JSP BBS</title>
</head>
<body>
<%
    Post post = new Post();
    UserDAO userDAO = new UserDAO();

    String folder = "/Users/jaeheon/Desktop/Dev/SCH-webproj-2023-1/web/UPLOAD";
    String encType = "utf-8";
    int maxSize = 5 * 1024 * 1024;


    MultipartRequest multi = null;
    multi = new MultipartRequest(request, folder, maxSize, encType, new DefaultFileRenamePolicy());

    String fileName = multi.getFilesystemName("fileName");
    String category_select = multi.getParameter("select_board");
    String title = multi.getParameter("post_title");
    String code = multi.getParameter("post_code");
    String postContext = multi.getParameter("post_context");

    ImgDAO imgDAO = new ImgDAO();
    int imgNo = imgDAO.addImg("UPLOAD/" + fileName, (String) session.getAttribute("userID"));

    if (session.getAttribute("userID") != null) {
        // category 설정
//        String category_select = request.getParameter("select_board");
        if (category_select == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('카테고리를 선택해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }


        String userID = (String) session.getAttribute("userID");

//        if (post.getPost_title() == null || post.getPost_context() == null) {
        if (title == null || postContext == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        } else {
            post.setPost_title(title);
            post.setPost_code(code);
            post.setPost_context(postContext);

            int result = -1;
            if (category_select.equals("질문 게시판")) {
                PostDAO dao = new PostDAO();
                result = dao.write(post, userDAO.getNoByUserId(userID), imgNo);
            }
            else if (category_select.equals("트렌드 IT")) {
                TrendPostDAO dao = new TrendPostDAO();
                result = dao.write(post, userDAO.getNoByUserId(userID), imgNo);
            }

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

    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 해주세요.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 보냄
        script.println("</script>");
    }

%>

</body>
</html>