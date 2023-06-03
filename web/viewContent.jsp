<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="user.User" %>
<%@ page import="post.PostDAO" %>
<%@ page import="user.UserDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SMARTALGO</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link href="CSS/mainPage.css" rel="stylesheet">

</head>
<body style="background-color: #efefef;">
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <img class="logo" src="IMG/nav_logo.jpg" height="40" onClick="location.href='index.jsp'">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav" id="check_login">
        <%
          int postNo = 0;
          if (request.getParameter("postNo") != null) {
            postNo = Integer.parseInt(request.getParameter("postNo"));
          }
          else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 게시글입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
          }
          Post post = new PostDAO().getPost(postNo);
          if (post.getPost_code() == null) {
            post.setPost_code("");
            // TODO : 트렌드 IT는 코드란 삭제
          }
          UserDAO userDAO = new UserDAO();

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
    <div class="row align-items-end">
      <div class="row">
        <div class="col">
        </div>
        <div class="col">
        </div>
        <div class="col">
          <!-- TODO : 버튼 정렬 -->
          <button class="btn btn-outline-success w-25" type="submit">목록</button>
          <button class="btn btn-outline-success w-25" type="submit">수정</button>
          <button class="btn btn-outline-success w-25" type="submit">삭제</button>
        </div>
      </div>
    </div>

    <br>
    <div class="panel" style="margin-left:1px;">
      <div id="contAreaBox">
        <div class="panel">
          <div class="panel-body">
            <form role="form" action="/board/create_action" method="post">
              <div class="table-responsive" style="text-align:center;">
                <table id="datatable-scroller"
                       class="table table-bordered" style="border-color: black;">
                  <caption></caption>
                  <colgroup>
                    <col width="250px" />
                    <col />
                  </colgroup>
                  <tbody>
                  <tr>
                    <th class="active" >작성자</th>
                    <td>
                      <span id="content_id"><%=userDAO.getNicknameByNo(post.getUser_no())
                              .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> </span>
                    </td>
                  </tr>
                  <tr>
                    <th class="active">제목</th>
                    <td>
                      <span id="content_title"><%=post.getPost_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></span>
                    </td>
                  </tr>

                  <%
                    if (post.getPost_category().equals("1")) {
                  %>
                  <tr>
                    <th class="active" >코드</th>
                    <td>
                      <span id="content_code"><%= post.getPost_code().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></span>
                    </td>
                  </tr>
                  <% }%>

                  <tr>
                    <th class="active" >내용</th>
                    <td>
                      <span id="content_detail"><%=post.getPost_context().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></span>
                    </td>
                  </tr>
                  <tr>
                    <th class="active" >이미지 파일</th>
                    <td>
                      <span id="content_image">테스트 이미지 파일입니다. (작성글 삽입된 이미지)</span>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row d-flex justify-content-center">
    <div class="col" style="margin-left: 7%; margin-right: 7%;">
      <div class="card shadow-0 border" style="background-color: #f0f2f5;">
        <div class="card-body p-4">
          <div class="form-outline mb-4">
            <input type="text" id="write_comment" class="form-control" placeholder="댓글을 작성해주세요..." />
            <!-- TODO : Form 형식으로 받아와야 하고, 한 칸 뛰거나 오른쪽 정렬 혹은 입력창 우측에 작성 버튼을 추가.-->
            <a href="#" label class="comment_button" id="add_comment" style="align: right">+ 댓글 추가하기</a><br>
          </div>
          <div class="card mb-4">
            <div class="card-body">
              <div class="blog-profile">
                <div class="row">
                  <div class="col">
                    <h5 id="comment_id">닉네임</h5>
                  </div>
                  <div class="col" style="text-align: right;">
                    &nbsp;
                    <a href="#" class="comment_button" id="comment_modify">수정</a>
                    |
                    <a href="#" class="comment_button" id="comment_delete">삭제</a>

                  </div>
                </div>
                <p id="comment_day" style="font-size: small;">2023-06-03</p>
              </div>
              <div id="comment_content" class="blog-content">
                <p>전능하신강재영이시여영원한빛으로절보호하소서강재영이시여제게이시련을헤쳐나갈수있는지혜를주시오항상당신만을따르겠나이다보잘것없는저에게기회를주시고살아가는의미를주시는강재영이시여헤아릴수없는당신의지혜</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script src="Trend_IT.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>