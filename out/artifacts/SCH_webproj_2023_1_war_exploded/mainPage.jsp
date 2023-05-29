<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainpage_Logout</title>
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
                    <a class="nav-link" href="#">Login</a> <!-- 로그인 되어 있을때만 존재 -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign up</a> <!-- 로그인 되어 있을때만 존재 -->
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
                    <img class="logo" src="Logo.png" height="250">
                </div>
                <div class="col">
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="row">
                <div class="col">
                </div>
                <div class="col" id="search">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2 w-200" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success w-25" type="submit">검색</button>
                    </form>
                </div>
                <div class="col">
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="row align-items-end">
            <div class="row">
                <div class="col" id="border_style">
                    <thead>
                    <tr>
                        <th scope="col">질문 게시판</th>
                    </tr>
                    <br>
                    <br>
                    </thead>
                    <!-- <tbody>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감2</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감3</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감4</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감5</a>
                        </td>
                      </tr>
                      <br>
                    </tbody> -->
                    <div class="list-group list-group-flush">
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감2</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감3</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감4</a>
                        <a class="list-group-item list-group-item-action">게시글 제목이 들어감5</a>
                    </div>
                </div>
                <div class="col" id="trend_it">
                    <thead>
                    <tr>
                        <th scope="col">트렌드 IT</th>
                    </tr>
                    <br>
                    <br>
                    </thead>
                    <!-- <tbody>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감2</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감3</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감4</a>
                        </td>
                      </tr>
                      <br>
                      <tr>
                        <td class="title">
                          <a href="#">게시글 제목이 들어감5</a>
                        </td>
                      </tr>
                      <br>
                    </tbody> -->
                    <div class="list-group list-group-flush">
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감2</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감3</a>
                        <a href="#" class="list-group-item list-group-item-action">게시글 제목이 들어감4</a>
                        <a class="list-group-item list-group-item-action">게시글 제목이 들어감5</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>