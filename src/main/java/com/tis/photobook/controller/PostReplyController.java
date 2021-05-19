package com.tis.photobook.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;
import com.tis.photobook.service.PostReplyService;

@RestController
public class PostReplyController {
	private static final Logger logger = LoggerFactory.getLogger(PostReplyController.class);
	
	@Autowired
	PostReplyService postReplyService;
	
		 @RequestMapping("/post/reply")
		 public ModelAndView post_reply_list(@RequestParam("post_no") int postNo) throws Exception {
			ModelAndView mv = new ModelAndView();
			List<PostReplyVO> reply = postReplyService.getReplyAllByPostNo(postNo);
			mv.addObject("pn", postNo);
			mv.addObject("replyList", reply);
			mv.setViewName("post/post_reply");
			return mv;
		}//end
		 
		 @RequestMapping("/post/detail_reply")
		 public ModelAndView post_detail_reply_list(@RequestParam("post_no") int postNo) throws Exception {
			ModelAndView mv = new ModelAndView();
			logger.info("post no :"+ postNo);
			List<PostReplyVO> reply = postReplyService.getReplyAllByPostNoDESC(postNo);
			mv.addObject("replyList", reply);
			mv.setViewName("post/post_reply_detail");
			return mv;
		}//end
		
		 @RequestMapping("/post/add_reply")
		 public String post_reply_insert(PostReplyDTO dto) throws Exception{
			 String result = "NO";
			 if(dto != null) {
			 	result = "post/reply?post_no="+dto.getPost_no();
			 	logger.info("add reply :"+ dto);
			 	postReplyService.addReply(dto);
			 }
			 return result;
		}//end
		 
		 @RequestMapping("/post/delete_reply")
		 public String post_reply_delete(@RequestParam("replyNo") int reply_no, @RequestParam("postNo") int post_no) throws Exception{
			 String result = "post/reply?post_no="+post_no;
			 	logger.info("del reply :"+ reply_no);
			 	postReplyService.delReply(reply_no);
			 return result;
		}//end
		 @RequestMapping("/post/modify_reply")
		 public String post_reply_modify(@RequestParam("replyNo") int reply_no, @RequestParam("postNo") int post_no, @RequestParam("replyContent") String content) throws Exception{
			 	String result = "post/reply?post_no="+post_no;
			 	PostReplyDTO dto = new PostReplyDTO();
			 	logger.info("modify = reply_no:"+ reply_no +", post_no :"+ post_no+", content :"+ content);
			 	dto.setReply_no(reply_no);
			 	dto.setContent(content);
			 	postReplyService.modifyReply(dto);
			 	
			 return result;
		}//end
	
	
}
