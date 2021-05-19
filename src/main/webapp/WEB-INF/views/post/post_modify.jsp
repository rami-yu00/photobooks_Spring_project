<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    

</head>

<body id="page-top" class="ov_flow_hidn">
    <%-- TOP(header) --%>
    <jsp:include page="../includes/top.jsp"></jsp:include>
    <%-- //TOP(header) --%>
    <!-- container-fluid Wrapper  -->
          <div class="container-fluid-Wrapper" >
            <div id="main_list" class="container px-sm-5">
            <form id="postModifyForm" name="postModifyForm" class="">
                <div class="d-flex justify-content-start align-items-center  mt-4 mb-3">
                    <h1 class="m-0 ">Posting</h1>
                    <p class="m-0 ml-2">수정하기<p>
                 </div>
                <div class="border rounded"></div>
                <div class="d-flex border justify-content-between align-items-center">
                    <div class="d-flex ml-3 justify-content-start align-items-center">
                       <a href="/photobook/user/${sessionScope.login.user_id}" class="d-flex align-items-center">
                          <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${sessionScope.login.user_img_name}');"></div>
                          <span class="ml-2 d-lg-inline ">${sessionScope.login.user_id}</span>
                       </a>
                    </div>
                    <div class="col-6 px-0 d-flex justify-content-end align-items-center" >
                        <div class="border" style="height: 36.5px; width: 2px;"></div>
                        <a for="uplodePostImg" title="게시물 삭제하기" href="javascript:postDel(${post.post_no});" class="modify_btn border required d-flex rounded reounded-3 justify-content-center align-items-center m-2 p-2" > 
                            <span aria-hidden="true" class="d-flex flex-wrap justify-content-center align-items-center">
	                           <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#999" class="bi bi-trash" viewBox="0 0 16 16">
								  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
                            </span>
                        </a>
                        <a for="uplodePostImg" title="수정 취소" href="javascript:window.history.back();" class="modify_btn border required d-flex rounded reounded-3 justify-content-center align-items-center mr-2 p-2" > 
                            <span aria-hidden="true" class="d-flex flex-wrap justify-content-center align-items-center">
                               <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#999" class="bi bi-x-lg" viewBox="0 0 16 16">
								  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
								</svg>
                            </span>
                        </a>
                        <input type="hidden" name="post_no" id="postNo" value="${post.post_no}"/>
                    </div>
                </div>
                
                <div class="border rounded"></div>
                <div class="border pr-1" style=" background-color: #dddddd4a;">
                    <div id="pw_viewList_wrap" class="col mdf" style="width: 100%; overflow: hidden; padding-bottom: 30%;">
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
                    
                    
                    
                    <a id="pw_back_btn"  href="javascript:void(0);" class="" rel="" role="button"></a>
                    <a id="pw_next_btn"  href="javascript:void(0);" class="" rel="" role="button"></a>
                    <ul class="d-flex p-0 m-0" id='View_list' data-file-count="${fn:length(post.post_file_list)}">
                        <c:forEach var="post_f" items="${post.post_file_list}">
                            <li class="file_label write m-2" style="background-image: url('${pageContext.request.contextPath}/resources/upload/${post_f.post_file_name}')"></li>
                        </c:forEach>
                    </ul>
                    </div>
                </div>
                <div class="border rounded"></div>
                <div class="d-flex" style="flex-direction: column;">
                    <textarea name="post_caption" class="border p-3" rows="7" cols=""  placeholder="내용을 입력해주세요.">${post.post_caption}</textarea>
	                <button type="button" id="modifyBtn" onclick="modifyPost(${post.post_no})"  class=" border rounded reounded-4">
	                   <span class="uplodeBtn_inside blockquote">게시</span>                                                   
	                </button>
                </div>
            </form>
            </div>
          </div>
         
    <!-- End of container-fluid Wrapper -->
    <%-- FOOTER --%>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <%-- //FOOTER --%>
    
<!-- Custom scripts for all pages-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/post_modify.js"></script>
<script>
$(document).ready(function(){
   var f_length = ${fn:length(post.post_file_list)};
   var pw_viewList_wrap = document.getElementById("pw_viewList_wrap");
   var viewList = document.getElementById("View_list");
   var vwrapW = pw_viewList_wrap.clientWidth;
   var itemW = 154.73;
   var vlistW = f_length * itemW;
   var index = 0 ;
   //back, next Btn show
   if(vwrapW<vlistW){
       $("#pw_back_btn").addClass("show");
       $("#pw_next_btn").addClass("show");
   }else{
       $("#pw_back_btn").removeClass("show");
       $("#pw_next_btn").removeClass("show");
   }
   $("#pw_back_btn").on('click',back);
   $("#pw_next_btn").on('click',next);
   function back() {
       if (index === 0) return; 
       index -= 1;
       viewList.style.transform = "translate3d(-"+(itemW * index)+"px, 0, 0)";
   };
   function next() {
       if (index === (f_length-1)) return;
       index += 1;
       viewList.style.transform = "translate3d(-"+(itemW * index)+"px, 0, 0)";
   };
});
</script>
</body>
</html>