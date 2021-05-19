<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>개인</title>
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>
<body id="page-top" class="ov_flow_hidn">
    <%-- TOP(header) --%>
    <div id="p_top">
        <jsp:include page="../includes/top.jsp"></jsp:include>
    </div>
    
    <%-- //TOP(header) --%>
        <div class="container-fluid-Wrapper" >
            <div id="main_user_page" class="container px-sm-5">
                <div class="py-4" id="user_page_top">
                    <div class="d-flex align-items-center mb-3">
                        <a href="/photobook/user/${user.user_id}" class="d-flex align-items-center">
                            <div class="user-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${user.user_img_name}');"></div>
                        </a>
                        <div class="col pl-sm-5">
                            <div class="d-flex align-items-center flex-wrap col pt-3">
                                <span class="mr-3">${user.user_id}</span>
                                <c:choose>
                                    <c:when test="${user.user_id eq sessionScope.login.user_id}">
                                        <span class="btn py-1 border mr-2" style="font-size: 80%;">프로필 편집</span>
                                        <span class="btn py-1 border" style="font-size: 80%;"><i class="bi bi-gear-wide"></i></span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${checkFollow eq 1}">
                                                <span id="followBtn" class="btn py-1 border mr-2 unfollow" onclick="unfollow(${user.user_no},${sessionScope.login.user_no})" data-user-id="${user.user_id}" title="${user.user_id} 님을 언팔 하려면 클릭하세요" style="font-size: 80%;">팔로우 <i class="bi bi-check2"></i></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span id="followBtn" class="btn py-1 border mr-2 follow" onclick="follow(${user.user_no},${sessionScope.login.user_no})" data-user-id="${user.user_id}" title="${user.user_id} 님을 팔로우 하려면 클릭하세요" style="font-size: 80%;">팔로우</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="btn py-1 border" style="font-size: 80%;">메세지</span>
                                    </c:otherwise>
                                </c:choose> 
                            </div>
                            <div class="col bg-white sidebar-profile py-3 d-flex  flex-wrap align-items-center justify-content-between rounded">
			                    <a class="text-center" title="준비중"><span class="d-block user_cnt">${user.post_count}</span><span class="d-block">게시물</span></a>
			                    <a class="text-center" title="준비중"><span class="d-block user_cnt">${user.user_follower}</span><span class="d-block">팔로워</span></a>
			                    <a class="text-center" title="준비중"><span class="d-block user_cnt">${user.user_following}</span><span class="d-block">팔로잉</span></a>
			                </div>
                        </div>
                         
                    </div>
                    <div class="">
                        <span>${user.user_intro}</span>
                    </div>
                </div>
                <hr class="m-0">
                <div class="">
                    <c:import url="/post/post_user_list">
                        <c:param name="userNo" value="${user.user_no}"></c:param>
                    </c:import>
                </div>
            </div>
        </div>
    <%-- FOOTER --%>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <%-- //FOOTER --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user_page.js"></script>
</body>
</html>