package com.tis.photobook.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.domain.PostVO;
import com.tis.photobook.dto.PostDTO;
import com.tis.photobook.dto.PostFileDTO;

public interface PostService {
	//포스트 insert
	public int Post(PostDTO post) throws Exception;
	
	//포스트 사진 insert
	public void insertPost_file(PostFileDTO fPost) throws Exception;
	
	//포스트 userpostlist
	public List<PostVO> userPostList(int user_no) throws Exception;
	
	//포스트 All
	public List<PostVO> postAll() throws Exception;
	
	//포스트 삭제
	public void delPost(int post_no) throws Exception;
	
	//포스트 수정-업데이트
	public void modifyPost( PostDTO dto)throws Exception;
	
	//포스트 detail
	public PostVO postDetail(int post_no) throws Exception;
	
	//포스트번호로 post file 가져오기
	public List<PostFileDTO> postNoToPostFile(int post_no) throws Exception;
	
	//포스팅 시간 표시하기 ex) 방금, 1분전, 1시간전 ...등등
	public String postingTime(Date post_reg_date) throws Exception;
	
	public int postLikesCount(int post_no) throws Exception;
	
	public int postLike_check(int post_no, int user_no) throws Exception;
	
	public PostDTO postLike_all(PostDTO dto)throws Exception;
	
	public void postLike_insert(PostDTO dto) throws Exception;
	
	public int postLike_Search_likeNo(PostDTO dto) throws Exception;
	
	public void postLike_delete(int like_no) throws Exception;
	
	
	
	
}//END
