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
    <div id="main_user_page" class="container">
        <div class="p-0" id="user_page_top">
			<div class="px-sm-4 px-lg-5">
			    <div class="col p-0 mb-4">
			        <!-- Illustrations -->
			        <div class="mb-4">
			            <div class="card-header photo_card_desc_icon px-3 py-3 d-flex align-items-center justify-content-between">
			                <a href="/photobook/user/${post.user_id}" class="d-flex align-items-center">
			                    <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${post.user_img_name}');"></div>
			                    <span class="ml-2 d-lg-inline ">${post.user_id}</span>
			                </a>
			                <a href="#" data-toggle="modal" data-target="#dPostMoreModal"  data-post-no="${post.post_no }" data-posting-user="${post.user_no }" data-active-user="${sessionScope.login.user_no }" class="d-flex px-2 align-items-center justify-content-center dpostMoreModal">
			                    <i class="bi bi-three-dots" data-target="#dPostMoreModal"  data-post-no="${post.post_no }" data-posting-user="${post.user_no }" data-active-user="${sessionScope.login.user_no }" ></i>
			                </a>
			            </div>
			            <div class="card-body " style=" padding: 0 20%; position: relative;">
			                     <a id="dsl_back_btn"  href="javascript:void(0);" class="slbtn_bk mover" onclick="sliderControl(this, ${post.post_no})" rel="" role="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="125" fill="%23333" class="bi bi-chevron-compact-left" viewBox="2 0 12 12">
                                        <path  fill="#f1ebeb73"  d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z"/>
                                    </svg>
                                </a>
                                <a id="dsl_next_btn"  href="javascript:void(0);" class="slbtn_nt mover" onclick="sliderControl(this, ${post.post_no})" rel="" role="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="125" fill="%23333" class="bi bi-chevron-compact-right" viewBox="2 0 12 12">
                                         <path fill="#f1ebeb73" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                                    </svg>
                                </a>
			                <div id="img_wrap" class="col text-center img-wrap" style="width: 100%; padding-bottom: 100%; min-height: 100%">
			                    
			                    <span id="dsl_index" class="sl_index mr-1 mt-1 py-2 pr-3"><span></span>/${fn:length(post.post_file_list)}</span>
			                    <ul id="dimg_list" class="imgs" style="width: calc(100% * ${fn:length(post.post_file_list)});" data-columns="${fn:length(post.post_file_list)}" data-post-no="${post.post_no}">
			                        <c:forEach var="pst_files" items="${post.post_file_list}">
			                            <li class="imgs_items mover" style="background-image: url('${pageContext.request.contextPath}/resources/upload/${pst_files.post_file_name}');"> </li>
			                        </c:forEach>
			                    </ul>
			                </div>
			            </div>
			            <div class="card-footer p-0">
			                <div class="col-12 photo_card_desc_icon py-3 px-3 d-flex align-items-center justify-content-between">
			                   <span class="d-flex justify-content-between align-items-center">
			                        <a id="dlikes" class=" mr-4 d-block d-flex align-items-center likes" href="javascript:void(0);" data-like-no="${post.like_no}" onclick="postLike('${post.like_check eq 1 ? 'delete' : 'insert' }', ${post.post_no})" ><i class="bi bi-suit-heart${post.like_check == 1? '-fill': ''}"></i></a>
			                        <a class=" mr-4 d-block d-flex align-items-center" title=" 댓글단유저보기 준비중" ><i class="bi bi-chat"></i></a>
			                        <a class=" d-block d-flex align-items-center" title="채팅 기능 준비중" ><i class="bi bi-envelope"></i></a>
			                   </span>
			                   <span><a class="d-flex justify-content-between align-items-center" title="북마크기능 준비중" ><i class="bi bi-bookmark"></i></a></span> 
			               </div>
			                <hr class="m-0">
			                <div class="px-3 py-3">
                                <form class="d-flex m-0" id="form${post.post_no}" name="form${post.post_no}" >
                                    <a href="/photobook/user/${sessionScope.login.user_id}" class="d-flex pr-3 align-items-center">
                                        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${sessionScope.login.user_img_name}');"></div>
                                        <span class="ml-2 d-lg-inline">${sessionScope.login.user_id}</span>
                                    </a>
                                    <input type="hidden" name="post_no" value="${post.post_no}">
                                    <input type="hidden" name="user_no" value="${sessionScope.login.user_no}">
                                    <input type="text" name="content" id="form${post.post_no}_content" class="col add_reply_input" placeholder="댓글 달기.." maxlength="500" required="required">
                                    <button type="button" onclick="submitReply(${post.post_no}); return false;" class=" border btn">게시</button>
                                </form>
                            </div>
                            <hr class="m-0">
			                <span id="dlike_count" class="px-3 mt-2 likes <c:if test="${post.like_count >= 1}">show</c:if>" data-like-count="${post.like_count}">좋아요 ${post.like_count} 개</span>
			                <div class="px-3 pt-2 pb-3 d-flex align-items-start" style="">
			                     <a href="/photobook/user/${post.user_id}" class="d-flex align-items-center">
			                        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${post.user_img_name}');"></div>
			                        <span class="ml-2 mr-3 d-lg-inline">${post.user_id}</span>
			                    </a>
			                    <span class="py-1"> ${post.post_caption}</span>
			                </div>
			                <div id="p_reply_div">
			                    <c:import url="/post/detail_reply">
			                        <c:param name="post_no" value="${post.post_no}"></c:param>
			                    </c:import>
			                </div>
			                <div class="col-12 px-3 pt-2 pb-2 " style="font-size: 80%;" >
			                    <fmt:formatDate var="formatPostDate" pattern="yyyy/MM/dd a hh:mm" value="${post.post_reg_date}"/>
			                    <c:out value="${formatPostDate}"></c:out> 작성됨
			                </div>
			                <hr class="m-0">
			                
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	</div>
    <%-- FOOTER --%>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <%-- //FOOTER --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user_page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/post_detail.js"></script>
<script type="text/javascript">
$(document).ready(function(){
     loadPost(${post.post_no});
});
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
    };
  }, true);

</script>
</body>
</html>
