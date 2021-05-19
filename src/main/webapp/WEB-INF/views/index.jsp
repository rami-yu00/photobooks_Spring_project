<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");  %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</head>

<body id="page-top" class="ov_flow_hidn">
	<%-- TOP(header) --%>
	<jsp:include page="includes/top.jsp"></jsp:include>
	<%-- //TOP(header) --%>
    <c:choose>
        <c:when test="${fn:length(postAllList) != 0}">
        
            <!-- container-fluid Wrapper  -->
            <div class="container-fluid-Wrapper" >
                <!-- Begin Page Content -->
                <div id="main_list" class="container mt-4 px-sm-5">
                    <!-- Content Row -->
                    <c:forEach var="pst" items="${postAllList}">
                    <div class="row">
                        <div class="col mb-4">
                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header photo_card_desc_icon px-3 py-3 d-flex align-items-center justify-content-between">
                                    <a href="/photobook/user/${pst.user_id}" class="d-flex align-items-center">
                                        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${pst.user_img_name}');"></div>
                                        <span class="ml-2 d-lg-inline ">${pst.user_id}</span>
                                    </a>
                                    <a href="#" data-toggle="modal" data-target="#postMoreModal"  data-post-no="${pst.post_no }" data-posting-user="${pst.user_no }" data-active-user="${sessionScope.login.user_no }" class="d-flex px-2 align-items-center justify-content-center postMoreModal">
                                        <i class="bi bi-three-dots"  data-target="#postMoreModal" data-post-no="${pst.post_no }" data-posting-user="${pst.user_no }" data-active-user="${sessionScope.login.user_no }" ></i>
                                    </a>
                                </div>
                                <div class="card-body p-0">
                                    <div id="img_wrap" class="col text-center img-wrap" style="width: 100%; padding-bottom: 100%; min-height: 100%">
                                        <a id="sl_back_btn_${pst.post_no}"  href="javascript:void(0);" class="slbtn_bk mover" onclick="sliderControl(this, ${pst.post_no})" rel="" role="button">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="125" fill="%23333" class="bi bi-chevron-compact-left" viewBox="2 0 12 12">
                                                <path  fill="#f1ebeb73"  d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z"/>
                                            </svg>
                                        </a>
                                        <a id="sl_next_btn_${pst.post_no}"  href="javascript:void(0);" class="slbtn_nt mover" onclick="sliderControl(this, ${pst.post_no})" rel="" role="button">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="125" fill="%23333" class="bi bi-chevron-compact-right" viewBox="2 0 12 12">
											     <path fill="#f1ebeb73" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
											</svg>
                                        </a>
                                        <span id="sl_index_${pst.post_no}" class="sl_index mr-1 mt-1 py-2 pr-3"><span></span>/${fn:length(pst.post_file_list)}</span>
                                        <ul id="img_list_${pst.post_no}" class="imgs" style="width: calc(100% * ${fn:length(pst.post_file_list)});" data-columns="${fn:length(pst.post_file_list)}" data-post-no="${pst.post_no}">
                                            <c:forEach var="pst_files" items="${pst.post_file_list}">
                                                <li class="imgs_items mover" style="background-image: url('resources/upload/${pst_files.post_file_name}');"> </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-footer p-0">
                                    <div class="col-12 photo_card_desc_icon py-3 px-3 d-flex align-items-center justify-content-between">
                                       <span class="d-flex justify-content-between align-items-center">
                                            <a id="likes_${pst.post_no}" class=" mr-4 d-block d-flex align-items-center likes" href="javascript:void(0);" data-like-no="${pst.like_no}" onclick="postLike('${pst.like_check eq 1 ? 'delete' : 'insert' }', ${pst.post_no})" ><i class="bi bi-suit-heart${pst.like_check == 1? '-fill': ''}"></i></a>
                                            <a class=" mr-4 d-block d-flex align-items-center" title="준비중" ><i class="bi bi-chat"></i></a>
                                            <a class=" d-block d-flex align-items-center" title="준비중" ><i class="bi bi-envelope"></i></a>
                                       </span>
                                       <span><a class="d-flex justify-content-between align-items-center" title="준비중" ><i class="bi bi-bookmark"></i></a></span> 
                                   </div>
                                    <hr class="m-0">
                                    <span id="like_count_${pst.post_no}" class="px-3 mt-2 likes <c:if test="${pst.post_likes >= 1}">show</c:if>" data-like-count="${pst.post_likes}">좋아요 ${pst.post_likes} 개</span>
                                    <div class="px-3 py-2 d-flex align-items-start" style="">
                                         <a href="/photobook/user/${pst.user_id}" class="d-flex align-items-center">
	                                        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${pst.user_img_name}');"></div>
	                                        <span class="ml-2 mr-3 d-lg-inline">${pst.user_id}</span>
                                        </a>
                                        <span class="py-1"> ${pst.post_caption}</span>
                                    </div>
                                    <div id="p_reply_div${pst.post_no}">
                                        <c:import url="/post/reply">
                                            <c:param name="post_no" value="${pst.post_no}"></c:param>
                                        </c:import>
                                    </div>
                                    <div class="col-12 px-3 pt-2 pb-2  " style="font-size: 80%;"  >
                                        <fmt:formatDate var="formatPostDate" pattern="yyyy/MM/dd a hh:mm" value="${pst.post_reg_date}"/>
                                        <c:out value="${formatPostDate}"></c:out> 작성됨
                                    </div>
                                    <hr class="m-0">
                                    <div class="px-3 py-3">
                                        <form class="d-flex m-0" id="form${pst.post_no}" name="form${pst.post_no}" >
                                            <a href="/photobook/user/${sessionScope.login.user_id}" class="d-flex pr-3 align-items-center">
	                                            <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${sessionScope.login.user_img_name}');"></div>
	                                            <span class="ml-2 d-lg-inline">${sessionScope.login.user_id}</span>
                                            </a>
                                            <input type="hidden" name="post_no" value="${pst.post_no}">
                                            <input type="hidden" name="user_no" value="${sessionScope.login.user_no}">
                                            <input type="text" name="content" id="form${pst.post_no}_content" class="col add_reply_input" placeholder="댓글 달기.." maxlength="500" required="required">
                                            <button type="button" onclick="submitReply(${pst.post_no}); return false;" class=" border btn">게시</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                </c:forEach>
            </div>
       <!-- End of container-fluid Wrapper -->
            </div>
            
       </c:when>
       <c:when test="${fn:length(postAllList) == 0}">
            <div class="container-fluid-Wrapper" >
                <!-- Begin Page Content -->
                <div id="main_list" class="container mt-4">
                    <div class="d-flex justify-content-center align-items-center">
		                <div class="col-6 mx-auto my-5">
		                        <p class="col py-4 text-center">
		                            <span>
			                            <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#0b4f64" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
										  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
										  <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
										</svg>
		                            </span>
		                            <span class="d-block m-4 blockquote">게시물이 없어요</span>
		                            <a class="btn border gr_brn" href="/photobook/post" style="font-size: 80%;">업로드하러가기!</a>
		                        </p>
		                </div>
		            </div>
                </div>
            </div>
       </c:when>
    </c:choose>
    
     <!-- End of Main Content -->
	<%-- FOOTER --%>
	<jsp:include page="includes/footer.jsp"></jsp:include>
	<%-- //FOOTER --%>
<!-- Custom scripts for all pages-->
<script type="text/javascript" src="resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    <c:forEach var="psts" items="${postAllList}">
      loadCard(${psts.post_no});
    </c:forEach>
});
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
    };
  }, true);

</script>
</body>
</html>
