<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="kr">
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
    <a class="navbar-brand" href="#">SmartAlgo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="view_id">
        <!-- <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">MainPage</a>
        </li> -->
        <li class="login_confirm invisible">
          <a class="nav-link" type="text">user_id</a> <!-- 로그인 되어 있으면 아이디 표시, 로그아웃 상태일때는 표시 없고 로그인 버튼 따로 있음 -->
        </li>
      </ul>
      <ul class="navbar-nav" id="check_login">
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a> <!-- 로그인 되어있지 않을 때 존재 -->
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Sign up</a> <!-- 로그인 되어있지 않을 때 존재 -->
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
    <div class="row align-items-center">
      <div class="row">
        <div class="col">

        </div>
        <div class="col" id="Search">
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success w-25" type="submit">검색</button>
          </form>
        </div>
        <div class="col" id="Writing">

        </div>
      </div>
      <br>
      <br>
      <br>
      <br>
      <div class="row align-items-center">
        <div class="row">
          <div class="col">
            <p style="background-color: #e3f2fd;">질문 게시판</p>
            <table class="table table-striped ">
              <tr class="text-center">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>조회</th>
              </tr>
              <tr>
                <td class="col-sm-1">1</td>
                <td><a href="#">안녕하세요. 질문있어요.</a></td>
                <td>강총무</td>
                <td>2023.05.29</td>
                <td class="col-sm-1">10</td>
              </tr>
            </table>
          </div>
          <div class="col">
            <p style="background-color: #e3f2fd;">트렌드 IT 게시판</p>
            <table class="table table-striped ">
              <tr class="text-center">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>조회</th>
              </tr>
              <tr>
                <td class="col-sm-1">1</td>
                <td><a href="#">미국이 놀라고 일본이 경악한 삼성의 기술</a></td>
                <td>애국맨</td>
                <td>2023.05.27</td>
                <td class="col-sm-1">10</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="row align-items-start">
        <div class="col">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>