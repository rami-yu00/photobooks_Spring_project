package com.tis.photobook.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.domain.PostVO;
import com.tis.photobook.dto.PostDTO;
import com.tis.photobook.dto.PostFileDTO;

public interface PostService {
	//����Ʈ insert
	public int Post(PostDTO post) throws Exception;
	
	//����Ʈ ���� insert
	public void insertPost_file(PostFileDTO fPost) throws Exception;
	
	//����Ʈ userpostlist
	public List<PostVO> userPostList(int user_no) throws Exception;
	
	//����Ʈ All
	public List<PostVO> postAll() throws Exception;
	
	//����Ʈ ����
	public void delPost(int post_no) throws Exception;
	
	//����Ʈ ����-������Ʈ
	public void modifyPost( PostDTO dto)throws Exception;
	
	//����Ʈ detail
	public PostVO postDetail(int post_no) throws Exception;
	
	//����Ʈ��ȣ�� post file ��������
	public List<PostFileDTO> postNoToPostFile(int post_no) throws Exception;
	
	//������ �ð� ǥ���ϱ� ex) ���, 1����, 1�ð��� ...���
	public String postingTime(Date post_reg_date) throws Exception;
	
	public int postLikesCount(int post_no) throws Exception;
	
	public int postLike_check(int post_no, int user_no) throws Exception;
	
	public PostDTO postLike_all(PostDTO dto)throws Exception;
	
	public void postLike_insert(PostDTO dto) throws Exception;
	
	public int postLike_Search_likeNo(PostDTO dto) throws Exception;
	
	public void postLike_delete(int like_no) throws Exception;
	
	
	
	
}//END
