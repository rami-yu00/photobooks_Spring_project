<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");  %>
<div class="bg-white sidebar-profile p-2 d-flex flex-wrap align-items-center justify-content-around rounded">
    <a class="collapse-item" href="/photobook/user/${sessionScope.login.user_id}">게시물 <span>${sessionScope.login.post_count}</span>&nbsp;</a>
    <a class="collapse-item" href="?">팔로워 <span>${sessionScope.login.user_follower}</span>&nbsp;</a>
    <a class="collapse-item" href="?">팔로잉 <span>${sessionScope.login.user_following}</span>&nbsp;</a>
</div>