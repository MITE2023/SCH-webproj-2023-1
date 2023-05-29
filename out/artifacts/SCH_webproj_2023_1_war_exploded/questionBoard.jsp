<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question_board_Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="CSS/Mainpage.css" rel="stylesheet">
</head>
<body style="background-color: #efefef;">

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    int pageNumber = 1;
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>

<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a href="index.jsp">
            <img class="logo" src="IMG/nav_logo.jpg" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav" id="check_login">
                <li class="nav-item">
                    <a class="nav-link" href="#">Logout</a> <!-- 로그인 되어 있을때만 존재 -->
                </li>
            </ul>
        </div>
    </div>
</nav>
<section>
    <div class="container text-center">
        <div class="row align-items-center">
            <div class="row">
                <div class="col">
                </div>
                <div class="col" id="Logo">
                    <img class="logo" src="IMG/Logo.png" height="250">
                </div>
                <div class="col">
                </div>
            </div>
        </div>
        <br>

        <div class="row align-items-center">
            <p style="background-color: #dee2e6; font-size: 20px;">질문 게시판</p>
            <table class="table table-striped ">
                <thead>
                <%-- TODO : 표 스타일 변경 --%>
                <tr class="text-center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                        <%
                            PostDAO postDAO = new PostDAO();
                            ArrayList<Post> list = postDAO.getList(pageNumber);
                            for (int i = 0; i < list.size(); i++) {
                        %>
                <tr>
                    <td><%=list.get(i).getPost_no()%></td>
                    <td><%=list.get(i).getPost_title()%></td> <!-- TODO : 제목 링크 연결 -->
                    <td><%=list.get(i).getUser_no()%></td>
                    <td><%=list.get(i).getPost_date().substring(0, 11) + list.get(i).getPost_date().substring(11, 13) + "시" + list.get(i).getPost_date().substring(14, 16) + "분" %></td>
                </tr>
                <%
                    }
                %>
                </tr>
                </tbody>
            </table>
            <!-- TODO : 페이지 넘버 -->
        </div>
        <div class="row align-items-center">
            <div class="row">
                <div class="col" id="Writing">
                    <button class="btn btn-outline-success w-25" type="button" onclick="location.href='write.jsp'"
                            style="float: left;">글쓰기
                    </button>
                </div>
                <div class="col">
                </div>
                <div class="col" id="Search">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success w-25" type="submit">검색</button>
                    </form>
                </div>
            </div>
        </div>
        <br>
        <div class="row align-items-center">
            <div class="col">
            </div>
            <div class="col">
                <nav aria-label="Page navigation example" style="margin-left: 20%;">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col">
            </div>
        </div>
    </div>
</section>
<script src="Trend_IT.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>