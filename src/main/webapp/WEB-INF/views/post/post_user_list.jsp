<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8");  %>

<div class="p-0 ">
    <div class="p-0 py-1 m-0 mb-3 d-flex justify-content-center align-items-center tab_bar">
        <span class="px-2 tab_active">게시물</span>
        <span class="px-2">준비중</span>
    </div>
    <c:choose>
        <c:when test="${fn:length(glist) == 0}">
            <div class="d-flex justify-content-center align-items-center">
                <div class="col-6 mx-auto my-4">
                <c:choose>
                    <c:when test="${ userNo eq sessionScope.login.user_no }">
                        <p class="col py-4 text-center">
                             <span>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="#0b4f64" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
                                   <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                   <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                 </svg>
                             </span>
                             <span class="d-block m-4 blockquote">게시물이 없어요</span>
                             <a class="btn border gr_brn" href="/photobook/post" style="font-size: 80%;">업로드하러가기!</a>
                         </p>
                    </c:when>
                    <c:otherwise>
                        <p class="col py-4 text-center">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#0b4f64" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                              <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                            </svg>
                        </span>
                        <span class="d-block m-4 blockquote">게시물이 없어요</span>
                        </p>
                    </c:otherwise>
                </c:choose> 
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="d-flex flex-wrap justify-content-start align-items-center" >
		      <c:forEach var="pst" items="${glist}">
		        <div class="col-4 p-1">
		        <a href="/photobook/post/detail?pNum=${pst.post_no}" class="post_list_grid d-block p_pdt_photo  bg-white border w-100" style=" background-image: url(${pageContext.request.contextPath}/resources/upload/${pst.post_file_name});">
		            <span class="post_p_overlay"></span>
		            <span class="post_product">
		                <span class="mr-2">
		                    <i class="bi bi-suit-heart"></i>&nbsp;${pst.like_count}
		                </span>
		                <span>
		                    <i class="bi bi-chat"></i>&nbsp;${pst.reply_count}
		                </span>
		            </span>
		        </a>
		        </div>    
		      </c:forEach>
		    </div>
        </c:otherwise>
    </c:choose>
</div>