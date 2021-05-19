package com.tis.photobook.service;

import java.util.List;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;

public interface PostReplyService {
	//Get reply -- 
	public List<PostReplyVO> getReplyAllByPostNo(int post_no) throws Exception;
	
	//Get reply -- 
	public List<PostReplyVO> getReplyAllByPostNoDESC(int post_no) throws Exception;
	
	//add reply --
	public void addReply(PostReplyDTO dto) throws Exception;
	
	//del reply --
	public void delReply(int reply_no) throws Exception;
	
	//modify reply --
	public void modifyReply(PostReplyDTO dto) throws Exception;
	
	//paging
	public int getStart(int pageNum, int row );
	public int getEnd(int pageNum, int row );
	public int getPageCount(int rowTotal , int row );
	public int getStartPage(int pageNum, int row);
	public int getEndPage(int startPage, int row);
	
	
	
}//end
