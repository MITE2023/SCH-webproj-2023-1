<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="/docs/5.3/assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <title>로그인</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

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
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">
    <form method="post" action="loginAction.jsp">

        <!-- <h1 class="h3 mb-3 fw-normal">로그인</h1> -->
        <div class="col" id="Logo">
            <a href="index.jsp"><img class="logo" src="IMG/Logo.png" height="250"></a>        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="userID" name="userID" placeholder="id">
            <label for="userID">아이디</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="userPW" name="userPW" placeholder="Password">
            <label for="userPW">비밀번호</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
        <div class="links">

            <a href="findPW.jsp">아이디/비밀번호 찾기</a> | <a href="signup.jsp">회원가입</a>

        </div>
    </form>
</main>



</body>
</html>