<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");  %>
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