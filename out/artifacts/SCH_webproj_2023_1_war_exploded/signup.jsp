<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link href="signup.css" rel="stylesheet">
</head>
<body>
<section class="bg-light">
  <div class="container py-4">
    <div class="row align-items-center justify-content-between">
      <a class="navbar-brand h1 text-center" href="index.do">
        <span class="text-dark h4">회원가입</span>
      </a>
    </div>
    <form method="post" action="signupAction.jsp">
      <div class="form-group">
        <label for="userID" class="form-label mt-4">아이디</label>
        <input type="text" class="form-control" name="userID" id="userID" aria-describedby="emailHelp">
      </div>
      <div class="form-group has-success">
        <label class="form-label mt-4" for="userPW">비밀번호</label>
        <input type="password" class="form-control is-vaild" id="userPW" name="userPW">
        <div class="valid-feedback"></div>
      </div>
      <div class="form-group has-danger">
        <label class="form-label mt-4" for="userPW2">비밀번호 재확인</label>
        <input type="password" class="form-control is-invaild" id="userPW2" name="userPW2">
        <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
      </div>
      <div class="form-group">
        <label for="userNickname" class="form-label mt-4">닉네임</label>
        <input type="text" class="form-control" name="userNickname" id="userNickname" aria-describedby="emailHelp">
      </div>
      <div class="d-grid gap-2">
        <br><br><button class="btn btn-primary btn-lg" type="submit">가입하기</button>
      </div>
    </form>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>