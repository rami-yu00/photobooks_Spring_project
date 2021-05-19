<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
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
            <form id="" class="" method="post" enctype="multipart/form-data">
                <div class="d-flex justify-content-start align-items-center  mt-4 mb-3">
                    <h1 class="m-0 ">Posting</h1>
                    <p class="m-0 ml-2">사진업로드!<p>
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
                        <label for="uplodePostImg" class="pw_lb_uplode_posting border required d-flex rounded reounded-3 justify-content-end align-items-center m-2 p-2" > 
                            <span aria-hidden="true" class="d-flex flex-wrap justify-content-center align-items-center">
                            <i class="fas fa-camera"></i>
                            
                        </span>
                        </label>
                        <input type="file" name="postFile" id="uplodePostImg" accept=".gif, .jpg, .png" class="required p-5" aria-required="true"  multiple="multiple" style="display: none;"/>
                        <input type="hidden" name="postUserNo" id="userNo" value="${sessionScope.login.user_no}"/>
                        <input type="hidden" name="postUserId" id="userId" value="${sessionScope.login.user_id}"/>
                    </div>
                </div>
                
                <div class="border rounded"></div>
                <div class="border pr-1" style=" background-color: #dddddd4a;">
                    <div id="pw_viewList_wrap" class="col" style="width: 100%; overflow: hidden; padding-bottom: 30%;">
                    <a id="pw_back_btn"  href="javascript:void(0);" class="" rel="" role="button"></a>
                    <a id="pw_next_btn"  href="javascript:void(0);" class="" rel="" role="button"></a>
                    <ul class="d-flex p-0 m-0" id='View_list'> 
                    </ul>
                    </div>
                </div>
                <div class="border rounded"></div>
                <div class="d-flex" style="flex-direction: column;">
                    <textarea name="postCaption" class="border p-3" rows="7" cols="" placeholder="내용을 입력해주세요."></textarea>
	                <button type="button" id="postBtn"  class=" border rounded reounded-4">
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
<script type="text/javascript" src="resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript" src="resources/js/post_write.js"></script>
</body>
</html>