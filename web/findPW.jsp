<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="kr" data-bs-theme="auto">
<head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Signin Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">

    <!-- Custom styles for this template -->
    <link href="CSS/login.css" rel="stylesheet">
    <link href="CSS/signup.css" rel="stylesheet">
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">
        <div class="col" id="Logo">
            <a href="index.jsp"><img class="logo" src="IMG/Logo.png" height="250"></a>        </div>

    <form method="post" action="findPWAction.jsp">
        <div class="form-floating">
            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디">
            <label for="userId">아이디</label>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" name="userNickname" id="userNickname" placeholder="닉네임">
            <label for="userNickname">닉네임</label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">비밀번호 찾기</button>
    </form>

    <div class="links">
        <a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a>
    </div>
</main>


</body>
</html>