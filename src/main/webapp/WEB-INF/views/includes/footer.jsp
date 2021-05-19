<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       
     
     
     <!-- Footer -->
     <!-- 
     <footer class="sticky-footer bg-white">
         <div class="container my-auto">
             <div class="copyright text-center my-auto">
                 <span>Copyright &copy; Your Website 2021</span>
             </div>
         </div>
     </footer>
     End of Footer 
     -->

   </div>
   <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Photo Book</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
						  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
						</svg>
                    </span>
                </button>
            </div>
            <div class="modal-body py-5 text-center">
                <p>
	                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
	                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                  <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
	                </svg>
                </p>
                <p class="pt-2 m-0">
                   정말 로그아웃 하시겠어요?
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/photobook/logout">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- post Detail Modal-->
<div class="modal fade" id="postMoreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content py-1 px-1">
		        <a class=" text-center btn btn-outline-dark"  id="postModify" > 게시물 수정하기 </a>
	            
	            <a class=" text-center btn btn-outline-dark " id="postDelete" > 게시물 삭제하기 </a>
	            
	            <a class=" text-center btn btn-outline-dark"  id="postDetail" > 게시물 자세히 보기 </a>
        </div>
    </div>
</div>

<!-- post Detail Modal-->
<div class="modal fade" id="dPostMoreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content py-1 px-1">
                <a class=" text-center btn btn-outline-dark"  id="dPostList" href="/photobook/index" >게시물 전체보기</a>
                
                <a class=" text-center btn btn-outline-dark" id="dPostModify" > 게시물 수정하기 </a>
                
                <a class=" text-center btn btn-outline-dark" id="dPostDelete" > 게시물 삭제하기 </a>

        </div>
    </div>
</div>