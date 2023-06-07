<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="post.TrendPostDAO" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMARTALGO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="CSS/mainPage.css" rel="stylesheet">
</head>
<body style="background-color: #efefef;">
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
                <%
                    if (session.getAttribute("userID") != null) {
                        String userID = (String) session.getAttribute("userID");
                        out.println("<li class='nav-item' style='line-height: 255%;'> <span>");
                        out.println(userID + "님 환영합니다.");
                        out.println("</span></li>");

                        out.println("<li class='nav-item'>");
                        out.println("<a class='nav-link' href='logoutAction.jsp'>Logout</a></li>");


                %>

                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a> <!-- 로그인 되어있지 않을 때 존재 -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Sign up</a> <!-- 로그인 되어있지 않을 때 존재 -->
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<section>
    <div class="container text-center">
        <div class="row align-items-start">
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
        <div class="row align-items-center">
            <div class="row align-items-center col-sm-6" style="max-height: 50%">
                <a href="questionBoard.jsp" style="background-color: #dee2e6; font-size: 20px;">질문 게시판 최신글</a>
                <table class="table table-striped" style="table-layout:fixed">
                    <colgroup>
                        <col width="12%" />
                        <col width="47%" />
                        <col width="17%" />
                        <col width="22%" />
                    </colgroup>
                    <thead>
                    <%-- TODO : 표 스타일 변경 --%>
                    <tr class="text-center"  style="position: sticky;">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                            <%

                            int pageNumber = 1;
                            if (request.getParameter("pageNumber") != null) {
                                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                            }

                            PostDAO postDAO = new PostDAO();
                            UserDAO userDAO = new UserDAO();
                            ArrayList<Post> list = postDAO.getList(pageNumber);
                            for (int i = 0; i < list.size(); i++) {
                        %>
                    <tr>
                        <td><%=list.get(i).getPost_no()%>
                        </td>
                        <td><a href="viewContent.jsp?postNo=<%=list.get(i).getPost_no()%>&category=1" class="post_title">
                            <%=list.get(i).getPost_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
                        </a></td>
                        <%--                    <td><%=list.get(i).getUser_no()%></td>--%>
                        <td><%=userDAO.getNicknameByNo(list.get(i).getUser_no())%>
                        </td>
                        <td><%=list.get(i).getPost_date().substring(0, 11) + list.get(i).getPost_date().substring(11, 13) + "시" + list.get(i).getPost_date().substring(14, 16) + "분" %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tr>
                    </tbody>
                </table>
                <!-- TODO : 페이지 넘버 -->
            </div>

            <div class="row align-items-center col-sm-6">
                <a href="trendBoard.jsp" style="background-color: #dee2e6; font-size: 20px;">트렌드 IT 게시판 최신글</a>
                <table class="table table-striped" style="table-layout:fixed">
                    <colgroup>
                        <col width="12%" />
                        <col width="47%" />
                        <col width="17%" />
                        <col width="22%" />
                    </colgroup>
                    <thead>
                    <%-- TODO : 표 스타일 변경 --%>
                    <tr class="text-center"  style="position: sticky;">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                            <%
                            TrendPostDAO trendPostDAO = new TrendPostDAO();
                            UserDAO userDAO2 = new UserDAO();
                            ArrayList<Post> list2 = trendPostDAO.getList(pageNumber);
                            for (int i = 0; i < list2.size(); i++) {
                        %>
                    <tr>
                        <td><%=list2.get(i).getPost_no()%>
                        </td>
                        <td><a href="viewContent.jsp?postNo=<%=list2.get(i).getPost_no()%>&category=2" class="post_title">
                            <%=list2.get(i).getPost_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
                        </a></td>
                        <td><%=userDAO2.getNicknameByNo(list2.get(i).getUser_no())%>
                        </td>
                        <td><%=list2.get(i).getPost_date().substring(0, 11) + list2.get(i).getPost_date().substring(11, 13) + "시" + list2.get(i).getPost_date().substring(14, 16) + "분" %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tr>
                    </tbody>
                </table>
                <!— TODO : 페이지 넘버 —>
            </div>
        </div>
    </div>
    <br><br>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>