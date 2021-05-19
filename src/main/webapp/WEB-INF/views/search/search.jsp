<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
    <div>user</div>
    <hr>
    <div>
        아아
        <%-- <a href="/photobook/user/${pst.user_id}" class="d-flex align-items-center">
            <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${pst.user_img_name}');"></div>
            <span class="ml-2 d-lg-inline ">${pst.user_id}</span>
        </a> --%>
    </div>
</div>
<div>
    <div>posting</div>
    <hr>
    <div>
        오오
        <%-- <a href="/photobook/post/detail?pNum=${pst.post_no}" class="d-flex align-items-center">
            <div class="card-img-profile rounded-circle" style="background-image: url(${pageContext.request.contextPath}/resources/upload/user/${pst.post_file_name});"></div>
            <span class="ml-2 d-lg-inline ">${post.post_caption}</span>
        </a> --%>
    </div>
</div>
