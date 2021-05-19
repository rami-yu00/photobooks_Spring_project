package com.tis.photobook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tis.photobook.dao.PostReplyDAO;
import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;
import com.tis.photobook.service.PostReplyService;

@Service
public class PostReplyServiceImpl implements PostReplyService{
	
	@Autowired
	PostReplyDAO rdao;

	@Override
	public List<PostReplyVO> getReplyAllByPostNo(int post_no) throws Exception {
		return rdao.getReplyAllByPostNo(post_no);
	}//end
	@Override
	public List<PostReplyVO> getReplyAllByPostNoDESC(int post_no) throws Exception {
		return rdao.getReplyAllByPostNoDESC(post_no);
	}//end
	
	@Override
	public void addReply(PostReplyDTO dto) throws Exception{
		rdao.addReply(dto);
	}//end
	
	
	@Override
	public void delReply(int reply_no) throws Exception{
		rdao.delReply(reply_no);
	}//end
	
	//modify reply --
	@Override
	public void modifyReply(PostReplyDTO dto) throws Exception{
		rdao.modifyReply(dto);
	}//end
	
	//paging
	public int getStart(int pageNum, int row ){
		return 0;
	}//end
	public int getEnd(int pageNum, int row ){
		return 0;
	}//end
	public int getPageCount(int rowTotal , int row ){
		return 0;
	}//end
	public int getStartPage(int pageNum, int row){
		return 0;
	}//end
	public int getEndPage(int startPage, int row){
		return 0;
	}//end
	
}//end
