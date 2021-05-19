<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8");  %>
<!-- Page Wrapper -->
<div id="wrapper" class="ov_flow_hidn">
	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
	    <!-- Sidebar - Brand -->
	    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/photobook/index">
	        <!-- <div class="sidebar-brand-icon rotate-n-15">
	            <i class="fas fa-camera-retro"></i>
	        </div> -->
	        <div class="sidebar-brand-text mx-3"><span>Photo</span> <span>Book</span></div>
	    </a>
	
	    <!-- Divider -->
	    <hr class="sidebar-divider my-0">
	    
       <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <div class="px-3 my-2">
               <a href="/photobook/post" class="rbw_btn">
                   <span class="py-2">upload</span>
               </a>
            </div>
        </li>
        <hr class="sidebar-divider my-0"> 
	
	    <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link d-flex flex-wrap align-items-center justify-content-between rounded" href="/photobook/user/${sessionScope.login.user_id}">
                <div class="sidebar-img-profile mx-auto bg-white border rounded-circle " style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${sessionScope.login.user_img_name}');"></div>
                <div class="col" align="center" > <span class="text-white blockquote ">${sessionScope.login.user_id}</span> </div>
            
            </a>
        
            <div id="top_sidebar" class="px-3">
                <div class="bg-white sidebar-profile p-2 d-flex flex-wrap align-items-center justify-content-around rounded">
                    <a class="collapse-item" href="/photobook/user/${sessionScope.login.user_id}">게시물 <span>${sessionScope.login.post_count}</span>&nbsp;</a>
                    <a class="collapse-item" title="준비중">팔로워 <span>${sessionScope.login.user_follower}</span>&nbsp;</a>
                    <a class="collapse-item" title="준비중">팔로잉 <span>${sessionScope.login.user_following}</span>&nbsp;</a>
                </div>
            </div>
        </li>
	    <!-- Divider -->
	    <hr class="sidebar-divider my-3"> 
	
	    <!-- Heading -->
	    <div class="sidebar-heading">
	        Addons
	    </div>
	
	    <!-- Nav Item - Pages Collapse Menu -->
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
	            aria-expanded="true" aria-controls="collapsePages">
	            <i class="fas fa-fw fa-folder"></i>
	            <span>준비중</span>
	        </a>
	        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <h6 class="collapse-header">게시판 보기 - 준비중</h6>
	                   <a class="collapse-item" >Link Item 1</a>
	                   <a class="collapse-item" >Link Item 2</a>
	                <div class="collapse-divider"></div>
	                <h6 class="collapse-header">북마크 - 준비중</h6>
	                   <a class="collapse-item" >Link Item 1</a>
                       <a class="collapse-item" >Link Item 2</a>
	            </div>
	        </div>
	    </li>
	
	    <!-- Nav Item - Charts -->
	    <li class="nav-item">
	        <a class="nav-link">
	           <i class="fas fa-fw fa-folder"></i>
	            <span>준비중</span></a>
	    </li>
	
	    <!-- Nav Item - Tables -->
	    <li class="nav-item">
	        <a class="nav-link" >
	            <i class="fas fa-fw fa-folder"></i>
	            <span>준비중</span></a>
	    </li>
	
	    <!-- Divider -->
	    <hr class="sidebar-divider d-none d-md-block">
	
	    <!-- Sidebar Toggler (Sidebar) -->
	    <div class="text-center d-none d-md-inline">
	        <button class="rounded-circle border-0" id="sidebarToggle"></button>
	    </div>
	
	
	</ul>
	<!-- End of Sidebar -->
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
	    <!-- Main Content -->
	    <div id="content" class="flex-direct-col ov_flow_hidn">
	
	        <!-- Topbar -->
	        <nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">
	
	            <!-- Sidebar Toggle (Topbar) -->
	            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	                <i class="fa fa-bars"></i>
	            </button>
	
	            <!-- Topbar Search -->
	            <form
	                class="d-none d-sm-inline-block form-inline ml-auto mr-md-3 my-2 my-md-0 mw-100 navbar-search">
	                <div class="input-group">
	                    <input type="text" style="background-color: #e3e6f0;" class="form-control border-0 small" placeholder="Search for..."
	                        aria-label="Search" aria-describedby="basic-addon2">
	                    <div class="input-group-append serch_btn">
	                        <button class="btn" type="button">
	                            <i class="fas fa-search fa-sm"></i>
	                        </button>
	                    </div>
	                </div>
	            </form>
	
	            <!-- Topbar Navbar -->
	            <ul class="navbar-nav ml-auto">
	
	                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	                <li class="nav-item dropdown no-arrow d-sm-none">
	                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
	                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <i class="fas fa-search fa-fw"></i>
	                    </a>
	                    <!-- Dropdown - Messages -->
	                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
	                        aria-labelledby="searchDropdown">
	                        <form class="form-inline mr-auto w-100 navbar-search">
	                            <div class="input-group">
	                                <input type="text" class="ml-4 form-control bg-light border-0 small "
	                                    placeholder="Search for..." aria-label="Search"
	                                    aria-describedby="basic-addon2">
	                                <div class="input-group-append">
	                                    <button class="btn btn-primary" type="button">
	                                        <i class="fas fa-search fa-sm"></i>
	                                    </button>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                </li>
	
	                <!-- Nav Item - Alerts -->
	                <li class="nav-item dropdown no-arrow mx-1">
	                    <a class="nav-link dropdown-toggle" title="Alerts" href="#" id="alertsDropdown" role="button"
	                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
							  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
							</svg>
	                        <!-- Counter - Alerts -->
	                        <span class="badge badge-danger badge-counter">3+</span>
	                    </a>
	                    <!-- Dropdown - Alerts -->
	                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                        aria-labelledby="alertsDropdown">
	                        <h6 class="dropdown-header">
	                            Alerts Center
	                        </h6>
	                        <a class="dropdown-item d-flex align-items-center" title="준비중..">
	                            <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/user/test.png"
                                        alt="...">
                                    <div class="status-indicator"></div>
                                </div>
	                            <div>
	                                test 유저님이 회원님을 팔로우 했습니다.
	                                <div class="small text-gray-500">? 분전</div>
	                            </div>
	                        </a>
	                        <a class="dropdown-item d-flex align-items-center" title="준비중..">
	                           <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/user/test.png"
                                        alt="...">
                                    <div class="status-indicator"></div>
                                </div>
	                            <div>
	                               
	                               test 유저님이 회원님의 게시물을 좋아합니다.
	                               <div class="small text-gray-500">? 분전</div>
	                            </div>
	                        </a>
	                        <a class="dropdown-item text-center small text-gray-500" >알림 더보기</a>
	                    </div>
	                </li>
	
	                <!-- Nav Item - Messages -->
	                <li class="nav-item dropdown no-arrow mx-1">
	                    <a class="nav-link dropdown-toggle" title="Messages" href="#" id="messagesDropdown" role="button"
	                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
							  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
							</svg>
	                        <!-- Counter - Messages -->
	                        <span class="badge badge-danger badge-counter">7</span>
	                    </a>
	                    <!-- Dropdown - Messages -->
	                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                        aria-labelledby="messagesDropdown">
	                        <h6 class="dropdown-header">
	                            Message Center
	                        </h6>
	                        <a class="dropdown-item d-flex align-items-center" title="준비중.." >
	                            <div class="dropdown-list-image mr-3">
	                                <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/user/test.png"
	                                    alt="...">
	                                <div class="status-indicator"></div>
	                            </div>
	                            <div>
	                                <div class="text-truncate">...</div>
	                                <div class="small text-gray-500">userId_01  ? 분전</div>
	                            </div>
	                        </a>
	                        <a class="dropdown-item d-flex align-items-center" title="준비중.." >
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/user/test.png"
                                        alt="...">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">... </div>
                                    <div class="small text-gray-500">userId_02  ? 분전</div>
                                </div>
                            </a>
	                        <a class="dropdown-item text-center small text-gray-500">메세지 더보기</a>
	                    </div>
	                </li>
	                  <!-- Nav Item - Messages -->
                    <li class="nav-item no-arrow mx-1">
                        <a class="nav-link " title="Home" href="/photobook/" role="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
							  <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
							</svg>
                        </a> 
                    </li>
	                <div class="topbar-divider d-none d-sm-block"></div>
	
	                <!-- Nav Item - User Information -->
	                <li class="nav-item dropdown no-arrow">
	                    <a class="nav-link dropdown-toggle" title="User Information" href="#" id="userDropdown" role="button"
	                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <span class="mr-3 d-none d-lg-inline text-gray-600 small">${sessionScope.login.user_id}</span>
	                        <div class="card-img-profile rounded-circle" style="background-image: url('${pageContext.request.contextPath}/resources/upload/user/${sessionScope.login.user_img_name}');"></div>
	                    </a>
	                    <!-- Dropdown - User Information -->
	                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                        aria-labelledby="userDropdown">
	                        <a class="dropdown-item" href="/photobook/user/${sessionScope.login.user_id}">
	                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                            My page
	                        </a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                            Logout
	                        </a>
	                    </div>
	                </li>
	
	            </ul>
	
	        </nav>
	        <!-- End of Topbar -->
	        
	        
        