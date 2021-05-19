<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<%-- Font Awesome --%>
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<%-- Custom CSS --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Photo Book · Login</title>
</head>
<body>
    <div id="p_login" class="container w-100 h-100">
       <div class="p_pf_board p-0 col-10 col-sm-9 col-md-8 col-lg-7 col-xl-6 col-xxl-5 mx-auto">
          <div class="loding_wrap ">
            <p class="loding_sp m-0 "></p>
          </div>
          <div class="loding_overlay  border rounded reounded-4 mb-4 py-5 px-4 bg-white">
              <p class="h2 pt-4 pb-3 m-0 p_title" align="center">Photo Book</p>
              <form name="init" id="Init" class="col-12 pt-3 pb-0 d-flex flex-wrap justify-content-center">
                  <div class="col-8 mb-4 px-0 ">
                    <input type="text" name="user_eid"  autocomplete="username" maxlength="20" oninput="changeEidFeedBack()" class="form-control " id="userEid" placeholder="이메일 또는 아이디" aria-describedby="eidFeedback" required>
                    <div id="eidFeedback" class="feedback"> </div>
                  </div>
                  <div class="col-8 mb-4 px-0 ">
                    <input type="password" name="user_pwd" maxlength="20" oninput="changePwdFeedBack()" class="form-control" id="userPwd" placeholder="비밀번호" aria-describedby="pwdFeedback" required>
                    <div id="pwdFeedback" class="feedback"> </div>
                  </div>                  
                  <button id="LOGIN" type="button" class="btn_pf col-8 border mt-2 mb-3" >login</button>    
              </form>
              <hr>
              <div class="col-12 mt-4" align="center"><a title="준비중" class="nextBtns">비밀번호를 잊으셨나요?</a></div>
              <div class="col-12 mt-3" align="center">계정이 없으신가요? <a href="/photobook/join" class="nextBtns">가입하기</a></div>
          </div>
       </div>         
    </div>
</body>
<%-- jquery --%>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<%-- Bootstrap --%>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%-- Core plugin JavaScript--%>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<%-- Join.js --%>
<script src="${pageContext.request.contextPath}/resources/js/login.js" type="text/javascript"></script>
</html>