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
    <img class="logo" src="IMG/nav_logo.jpg" height="40">
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
    <div class="row align-items-center">
      <div class="col">
        <button class="btn btn-outline-success" type="submit" onClick="location.href='writeAction.jsp'" style="float: right;">작성완료</button>
      </div>
      <br>
      <br>
      <form action="writeAction.jsp" method="post">
        <div class="col">
          <div class="choose_board">
                                <span class="ps_box focus">
                                    <select class="form-select" id="select_board">
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
                                  placeholder="코드를 입력해주세요" required
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
          <div class="upload-box">
            <div id="drop-file" class="drag-file">
              <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
              <p class="message">이미지 드롭 가능</p>
              <img src="" alt="미리보기 이미지" class="preview">
            </div>
          </div>
          <label class="file-label" for="chooseFile">이미지 업로드</label>
          <input class="file" id="post_img"
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