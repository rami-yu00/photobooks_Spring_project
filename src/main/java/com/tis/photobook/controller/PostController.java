package com.tis.photobook.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.HttpResource;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.domain.PostVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.PostDTO;
import com.tis.photobook.dto.PostFileDTO;
import com.tis.photobook.service.PostReplyService;
import com.tis.photobook.service.PostService;

@RestController
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	PostService postService;
	
	//=========================[ post output ]============================/
	@RequestMapping("/index")
	public ModelAndView post_list_main(HttpSession session) throws Exception {
		UsersVO user = (UsersVO)session.getAttribute("login");
		ModelAndView mv = new ModelAndView();
		List<PostVO> postAllList = postService.postAll();
		logger.info("PostAll"+ postAllList);
		for(PostVO plist : postAllList) {
			List<PostFileDTO> pf_dto = postService.postNoToPostFile(plist.getPost_no());
			PostDTO dto = new PostDTO();
			dto.setPost_no(plist.getPost_no()); dto.setUser_no(user.getUser_no());
			PostDTO pdto = postService.postLike_all(dto);
			if(pdto != null) {
				plist.setLike_no(pdto.getLike_no());
			}else { plist.setLike_no(0); }
			int post_likes = postService.postLikesCount(plist.getPost_no());
			int like_check = postService.postLike_check(plist.getPost_no(), user.getUser_no());
			plist.setPost_file_list(pf_dto);
			plist.setPost_likes(post_likes);
			plist.setLike_check(like_check);
			logger.info("Post No: "+ plist.getPost_no());
			logger.info("Post File Data : "+ pf_dto);
		}
		mv.addObject("postAllList", postAllList);
		mv.setViewName("index");
		return mv;
	}//end
	
	@RequestMapping("/post/detail")
	public ModelAndView post_detail(@RequestParam("pNum") int post_no, HttpSession session) throws Exception {		
		ModelAndView mv = new ModelAndView();
		UsersVO user = (UsersVO)session.getAttribute("login");
		PostVO post = postService.postDetail(post_no);
		
		List<PostFileDTO> pf_dto = postService.postNoToPostFile(post_no);
		PostDTO dto = new PostDTO(); dto.setPost_no(post_no); dto.setUser_no(user.getUser_no());
		
		PostDTO pdto = postService.postLike_all(dto);
		if(pdto != null) {
			post.setLike_no(pdto.getLike_no());
		}else { 
			post.setLike_no(0); 
		}
		int like_check = postService.postLike_check(post_no, user.getUser_no());
		post.setPost_file_list(pf_dto);
		post.setLike_check(like_check);
		logger.info("post {}", post);
		mv.addObject("post", post);
		mv.setViewName("/post/post_detail");
		return mv;
	}//end
	
	@RequestMapping("/post/post_user_list")
	public ModelAndView post_grid_list(@RequestParam("userNo") int user_no) throws Exception {
		ModelAndView mv = new ModelAndView();
		logger.info("-------------------------------------------------");
		logger.info(" user No     : "+ user_no);
		List<PostVO> glist = postService.userPostList(user_no);
		mv.addObject("userNo", user_no);
		mv.addObject("glist", glist);
		mv.setViewName("/post/post_user_list");
		return mv;
	}//end
	
	
	//=========================[ post write ]============================/
	@RequestMapping("/post")//post write form
	public ModelAndView post_write() {
		return new ModelAndView("/post/post_write");
	}//end

	
	@PostMapping("/post/upload")//post 업로드 
	public void post_upload(
		MultipartFile[] postFile, 
		@RequestParam("postUserNo") int user_no, 
		@RequestParam("postCaption") String post_caption, 
		@RequestParam("postUserId") String user_id ,
		@RequestParam("postFileCount") int post_file_count ) throws Exception {
			logger.info("update ajax Post... ");
			PostDTO post = new PostDTO();
			logger.info("-------------------------------------------------");
			logger.info("Post user Id     : "+ user_id);
			logger.info("Post user No     : "+ user_no);
			logger.info("Post caption     : "+ post_caption);
			logger.info("Post File Count  : "+ post_file_count);
			post.setUser_no(user_no);
			post.setPost_caption(post_caption);
			post.setPost_file_count(post_file_count);
			int post_no = postService.Post(post);
			String index1="";
			PostFileDTO fPost = new PostFileDTO();
			for(int i=0 ; i< postFile.length; i++) {
				index1= postFile[0].getOriginalFilename();
			}
			for(MultipartFile file : postFile ) {
				fPost.setPost_file_thumbnail(index1);
				fPost.setPost_no(post_no);
				fPost.setPost_file_original_name(file.getOriginalFilename());
				fPost.setFile(file);
				postService.insertPost_file(fPost);
			}//end
			
	}//end
	
	//=========================[ post 수정폼 ]============================/
	@RequestMapping("/post/modify")//post write form
	public ModelAndView post_modify(@RequestParam("pNum") int post_no) throws Exception {
		ModelAndView mv = new ModelAndView();
		PostVO post = postService.postDetail(post_no);
		List<PostFileDTO> pf_dto = postService.postNoToPostFile(post_no);
		post.setPost_file_list(pf_dto);
		
		mv.addObject("post", post);
		mv.setViewName("/post/post_modify");
		return mv;
	}//end
	
	//=========================[ post 수정 Save ]============================/
	@RequestMapping("/post/modify_upload")//post write form
	public String post_modify_upload(PostDTO dto) {
		String result = "NO";
		if(dto != null) {
			result = "OK";
		}
		
		
		return result;
	}//end

	//=========================[ post 삭제 ]============================/
	@RequestMapping("/post/delete")//post write form
	public void post_delete(@RequestParam("pNum") int post_no, HttpServletResponse response )throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		logger.info("Del post No : "+ post_no);
		postService.delPost(post_no);
		out.println("<script>");
		out.println("alert('게시물이 삭제되었습니다.');");
		out.println("location.href='/photobook/index'");
		out.println("</script>");
	}//end
	
	//=========================[ post like ]============================/
	 @RequestMapping("/post/like_insert")
	 public Map<String, Integer> like_insert(@RequestParam("post_no") int pno, HttpSession session)throws Exception {
		 Map<String, Integer> data = new HashMap<>();
		 UsersVO user = (UsersVO)session.getAttribute("login");
		 PostDTO dto = new PostDTO();
		 dto.setPost_no(pno);
		 dto.setUser_no(user.getUser_no());
		 postService.postLike_insert(dto);
		 logger.info("like_insert post No : "+ pno);
		 logger.info("like_insert user No : "+ user.getUser_no());
		 
		 int like_no = postService.postLike_Search_likeNo(dto);
		 data.put("getLikeNo", like_no);
		 return data;
	 };
	 
	 @RequestMapping("/post/like_delete")
	 public void like_delete(@RequestParam("like_no") int likeNo) throws Exception {
		 postService.postLike_delete(likeNo);
		 logger.info("like_delete like No : "+ likeNo);
	 };

	
}//class END
