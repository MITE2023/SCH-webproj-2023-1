<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Writing</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

  <link href="CSS/mainPage.css" rel="stylesheet">

</head>
<body style="background-color: #efefef;">
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <img class="logo" src="IMG/nav_logo.jpg" height="40">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="view_id">
        <!-- <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">MainPage</a>
        </li> -->
        <li class="login_confirm">
          <a class="nav-link" type="text">user_id</a> <!-- 로그인 되어 있으면 아이디 표시, 로그아웃 상태일때는 표시 없고 로그인 버튼 따로 있음 -->
        </li>

      </ul>
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

    <button type="submit" class="btn btn-secondary">제출하기</button>
    <div class="row align-items-center">
      <form action="writerAction" method="post">
        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            게시판 선택
          </button>
          <ul class="dropdown-menu">
            <li><a class="질문 게시판" href="#">Action</a></li>
            <li><a class="트렌드 IT" href="#">Another action</a></li>
          </ul>
        </div>
        <input type="text" name="bdTitle" class="form-control mt-4 mb-2"
               placeholder="제목을 입력해주세요." required
        >
        <div class="form-group">
                        <textarea class="form-control" rows="10" name="bdContent"
                                  placeholder="내용을 입력해주세요" required
                        ></textarea>
        </div>
      </form>
    </div>
  </div>
</section>
<script src="Trend_IT.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>