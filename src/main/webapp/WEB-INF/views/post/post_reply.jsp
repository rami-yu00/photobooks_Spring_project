<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");  %>
<c:if test="${fn:length(replyList) > 2}">
   <div class="col-12 px-3 py-1 " style="font-size: 80%;">
    <a href="/photobook/post/detail?pNum=${pn}">총 ${fn:length(replyList)} 개의 댓글 더보기</a>
   </div>
</c:if>
<c:forEach var="reply" items="${replyList}" end="2" >
<div class="px-3 py-2 d-flex justify-content-between align-items-start reply_wrap" style="">
    <a href="/photobook/user/${reply.user_id}" class="d-flex align-items-center">
        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${reply.user_img_name}');"></div>
        <span class="ml-2 mr-3 d-lg-inline">${reply.user_id}</span>
    </a>
    <span class="pt-1 p-0 col">
        <span id="content${reply.reply_no}">${reply.content}</span>  
        <span class="pl-2" style="font-size: 80%;">
	        <fmt:formatDate var="formatReplyDate" pattern="yyyy/MM/dd a hh:mm" value="${reply.reply_reg_date}"/>
	        - <c:out value="${formatReplyDate}"></c:out>
        </span>
    </span>
    <span class="delete_reply  d-flex align-items-center">
        <c:if test="${reply.user_no eq sessionScope.login.user_no}">
            <span id="modifyBtn${reply.reply_no}" class="pt-1" onclick="modifyReply(${reply.post_no},${reply.reply_no},'${reply.content}')" style="font-size: 85%;">수정</span>
            <span class="pt-1" onclick="deleteReply(${reply.post_no},${reply.reply_no})" ><i class="bi bi-x"></i></span>
        </c:if>
    </span>
</div>
</c:forEach>
