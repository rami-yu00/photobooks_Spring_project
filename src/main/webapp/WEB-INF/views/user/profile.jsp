<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<%-- Font Awesome --%>
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<%-- Custom CSS --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Photo Book · Login</title>
</head>
<body>
	<div id="p_join_profile" class="container w-100 h-100 bg-sm-light bg-light">
		<div class="p_pf_board col-md-8 col-lg-7 col-xl-6 col-xxl-5 mx-auto p-md-4 p-lg-4 p-xl-4 p-xxl-4 px-0">
			<div class=" rounded reounded-4 mb-md-4 mb-lg-4 mb-xl-4 mb-xxl-4 py-md-5 py-lg-5 py-xl-5 py-xxl-5 py-0 px-0 px-md-4 px-lg-4 px-xl-4 px-xxl-4  bg-light">			     
				<p class="h2 py-1 m-0 mt-5 pt-5 p_title p_pf" align="center"> Photo Book</p>
				<div class="col-10 mx-auto pb-3 pt-5 d-flex flex-wrap justify-content-center" style="text-align: center;">
					
					<div class="p_subtitle p_pf mx-auto h4">
						<strong class="fw-bolder ">${sessionScope.login.user_id}</strong>님,&nbsp;
						<strong class=" fw-bolder">PhotoBook</strong>에 오신것을 환영합니다.
					</div>
				</div>
				<%-- item group start --%>
				<div class="col-10 py-0 px-0 mx-auto d-flex flex-wrap align-items-center justify-content-center">
					<div class="container-fluid p-0" style=" min-height: calc(100vh - 700px); overflow: hidden; width: 100%;">
						<div class="loding_wrap ">
	                           <p class="loding_sp m-0 "></p>
	                    </div>
						<p class="col-9 mx-auto my-0 text-center pf_msgWrap_1">
							<em class="pf_msg_1" >친구들이 회원님을 알아볼 수 있도록 <br>프로필을 완성하세요</em>
						    <i class="pf_msg_2 far d-flex align-items-center justify-content-center fa-window-minimize" style="opacity: 0;"></i>
						</p>
						
						<%-- item group wrap --%>
						<div class="mx-auto p-0  border border-light bg-light rounded reounded-4 loding_overlay_2 " style="overflow: hidden; width: 100%;">
							<div class="panel-group d-flex" id="carouselSlide" style="width: 300%;" role="tablist" aria-multiselectable="true">
								
								<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
								<%-- item 1 --%>
								<div class="panel panel-default d-flex align-items-center p-0 justify-content-center" style="width: 100%;">
									<div id="collapse1" style="overflow: hidden; position: relative;" class="panel-collapse px-4 pt-1 pb-5" role="tabpanel">
										<div class="panel-body ">
											<form id="profile_img" method="post" enctype="multipart/form-data">
												<p class="mt-4 mb-5 ">
													<label for="uplodeFile" id='View_area'								   
														class=" file_label border required d-flex mx-auto rounded-circle justify-content-center align-items-center" > 
														    <span aria-hidden="true" class="d-flex flex-wrap justify-content-center align-items-center">
															<i class="fas fa-camera w-100 d-flex justify-content-center align-items-center"></i>
															<br><span>사진추가</span>
													    </span>
													</label>
													<input type="file" name="uplode_file" id="uplodeFile" accept=".gif, .jpg, .png" class="required p-5" aria-required="true" onchange="previewImage(this,'View_area')" style="display: none;"/>
													<input type="hidden" name="userNo" id="userNo" value="${user.user_no}"/>
													<input type="hidden" name="userId" id="userId" value="${user.user_id}"/>
												</p>
												<p align="center">
													<label class="mb-4"><small>Phtobook에서 회원님을 나타낼 프로필 사진을 선택하세요.</small></label> 
													<button type="button" id="uplodeBtn"  class="col-8 py-3 border rounded reounded-4 btn_pf">
													   <span class="uplodeBtn_inside">사진등록하기</span>													  
													</button>
												</p>
											</form>
											<p class="text-center"><a class="nextBtn nextBtns">건너뛰기</a>	</p>
										    
										</div>
										 
									</div>
								</div>
								<%-- //item 1 --%>
								<%-- item 2 --%>
								<div class="panel panel-default d-flex align-items-start p-0 justify-content-center" style="width: 100%;">
									<div id="collapse2" style="overflow: hidden; position: relative;" class="panel-collapse px-4 pt-1 pb-4" role="tabpanel">										
										<div class="panel-body">
											<form>
												<p align="center">
													<label class="col-10 pt-1 pb-3"><em>친구들이 회원님을 알아볼 수 있도록 이름과 성을 모두 추가하세요</em></label>
													<input type="text" id="userName" placeholder="이름" class="h5 col-6 py-3 border rounded reounded-4 text-center">
												</p>
												<p align="center">
													<label class="col-10 py-3"><em>팔로워에게 회원님에 대해 간단히 소개해 주세요.</em></label>
													<textarea cols="25" rows="3" id="userIntro" class="h5 col-8 py-3 border rounded reounded-4"></textarea>
												</p>
												<P align="center">
												    <button type="button" id="uplodeBtn2" class="btn_pf col-6 py-3 border rounded reounded-4">
												        <span class="uplodeBtn_inside2">이름 및 소개 등록하기</span>										
												    </button>
												</P>
											</form>
											<p class="text-center"><a class="nextBtn2 nextBtns">건너뛰기</a></p>
										</div>
									</div>
								</div>
								<%-- //item 2 --%>								
								<%-- item 3 --%>
								<div class="panel panel-default d-flex flex-wrap align-items-center justify-content-center p-0 " style="width: 100%;">
									<div id="collapse3" style="overflow: hidden; position: relative;" class="panel-collapse px-4 pt-5 pb-5" role="tabpanel">
                                        <div class="panel-body">
										    <p  class="mb-5 " style="height: 12rem;">
										       <span class=" success_icon border required d-flex mx-auto rounded-circle justify-content-center align-items-center">
										           <i class="fas fa-check"></i>
										       </span>									    
										    </p>
											<p class="text-center col-10 mx-auto p-0 mb-4 " >프로필설정에서 언제든지 이 정보를 업데이트 할 수 있습니다.</p>
											<P align="center">
	                                              <button id="goHomeBtn" type="button" class="btn_pf col-8 py-3 border rounded reounded-4">가입 완료하기</button>
	                                       </P>	
                                       </div>									
								    </div>
								</div>								
								<%-- //item 3 --%>
							</div>
						</div>
					</div>
				</div>
				<%-- //item group --%>
			</div>
		</div>
	</div>
	
</body>
<%-- jquery --%>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.form.js" type="text/javascript"></script>
<%-- Bootstrap --%>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%-- Core plugin JavaScript--%>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<%-- Join.js --%>
<script src="${pageContext.request.contextPath}/resources/js/profile.js" type="text/javascript"></script>
</html>