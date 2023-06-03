<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import ="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Writing</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

  <link href="CSS/Mainpage.css" rel="stylesheet">

</head>
<body style="background-color: #efefef;">
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a href ="index.jsp">
      <img class="logo" src="IMG/nav_logo.jpg" height="40">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav" id="check_login">
        <%
          if(session.getAttribute("userID") != null) {
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
      <div class="col">
        <button class="btn btn-outline-success" type="submit" onClick="location.href='writeAction.jsp'" style="float: right;">작성완료</button>
      </div>
      <br>
      <br>
      <form action="writeAction.jsp" method="post" enctype="multipart/form-data">
        <div class="col">
          <div class="choose_board">
                                <span class="ps_box focus">
                                    <select class="form-select" id="select_board" name="select_board">
                                        <option value="" selected disabled hidden>게시판 선택</option>
                                        <option>질문 게시판</option>
                                        <option>트렌드 IT</option>
                                    </select>
                                </span>
          </div>
        </div>
        <input type="text" name="post_title" class="form-control mt-4 mb-2" id="post_title"
               placeholder="제목을 입력해주세요." required
        >
        <div class="form-group">
                        <textarea class="form-control" rows="7" name="post_code" id="post_code"
                                  placeholder="코드를 입력해주세요"
                        ></textarea>
        </div>
        <br>
        <div class="form-group">
                        <textarea class="form-control" rows="7" name="post_context" id="post_context"
                                  placeholder="내용을 입력해주세요" required
                        ></textarea>
        </div>
        <br>
        <div class="form-group">
          <label class="file-label">이미지 업로드</label>
          <input class="file" id="post_img" name="fileName"
                 type="file"
                 onchange="dropFile.handleFiles(this.files)"
                 accept="image/png, image/jpeg, image/gif"
          >
          <br>
          <br>
        </div>
        <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
      </form>
    </div>
  </div>
</section>
<script src="JS/trendIT.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>