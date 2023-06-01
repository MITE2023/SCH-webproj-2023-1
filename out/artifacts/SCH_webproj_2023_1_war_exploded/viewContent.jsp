<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View_content_Login</title>
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
    <div class="row align-items-end">
      <div class="row">
        <div class="col">
        </div>
        <div class="col">
        </div>
        <div class="col">
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
                      <span id="content_id">테스트 작성자입니다(아이디 표시)</span>
                    </td>
                  </tr>
                  <tr>
                    <th class="active">제목</th>
                    <td>
                      <span id="content_title">테스트 제목입니다.(작성글 제목)</span>
                    </td>
                  </tr>
                  <tr>
                    <th class="active" >코드</th>
                    <td>
                      <span id="content_code">테스트 코드입니다. (작성글 코드 본문)</span>
                    </td>
                  </tr>
                  <tr>
                    <th class="active" >내용</th>
                    <td>
                      <span id="content_detail">테스트 내용입니다. (작성글 내용 본문)</span>
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
            <a href="#" label class="form-label" id="submit_comment">+ 댓글 추가하기</a>
          </div>

          <div class="card mb-4">
            <div class="card-body">
              <p id="comment_content">------------------댓글 내용 1-----------------</p>
              <div class="d-flex justify-content-between">
                <div class="d-flex flex-row align-items-center">
                  <p class="small mb-0 ms-2" id="comment_id">아이디1</p>
                </div>
              </div>
            </div>
          </div>

          <div class="card mb-4">
            <div class="card-body">
              <p id="comment_content">------------------댓글 내용 2-----------------</p>
              <div class="d-flex justify-content-between">
                <div class="d-flex flex-row align-items-center">
                  <p class="small mb-0 ms-2" id="comment_id">아이디2</p>
                </div>
              </div>
            </div>
          </div>

          <div class="card mb-4">
            <div class="card-body">
              <p id="comment_content">------------------댓글 내용 3-----------------</p>
              <div class="d-flex justify-content-between">
                <div class="d-flex flex-row align-items-center">
                  <p class="small mb-0 ms-2" id="comment_id">아이디3</p>
                </div>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              <p id="comment_content">------------------댓글 내용 4-----------------</p>
              <div class="d-flex justify-content-between">
                <div class="d-flex flex-row align-items-center">
                  <p class="small mb-0 ms-2" id="comment_id">아이디4</p>
                </div>
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