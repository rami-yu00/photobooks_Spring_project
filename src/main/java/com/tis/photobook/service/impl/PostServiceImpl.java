package com.tis.photobook.service.impl;

import java.io.File;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tis.photobook.dao.PostDAO;
import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.domain.PostVO;
import com.tis.photobook.dto.PostDTO;
import com.tis.photobook.dto.PostFileDTO;
import com.tis.photobook.service.PostService;

@Service
public class PostServiceImpl implements PostService{
	private static final Logger logger = LoggerFactory.getLogger(PostServiceImpl.class);
	@Autowired
	PostDAO pdao;
	
	@Inject
	@Autowired
	ServletContext application;

	@Override
	public int Post(PostDTO post) throws Exception {
		pdao.insertPost(post);
		return pdao.selectPostNo(post);
	}//end

	@Override
	public void insertPost_file(PostFileDTO fpost) throws Exception {
		//���� ��� ��������
		String path = application.getRealPath("/resources/upload");
		//����uuid���� �ϱ�
		UUID uuid = UUID.randomUUID();
		String saved_name="";
		logger.info("-------------------------------------------------");
		if(fpost.getPost_file_original_name().equals(fpost.getPost_file_thumbnail())) {
			saved_name= "s_"+uuid.toString()+"_"+fpost.getPost_file_original_name();
		}else {
			saved_name = uuid.toString()+"_"+fpost.getPost_file_original_name();
		}
		File file = new File(path, saved_name);
		fpost.getFile().transferTo(file);
		fpost.setPost_file_name(saved_name);
		pdao.insertPostFile(fpost);
		
	}//end
	
	public List<PostVO> userPostList(int user_no) throws Exception{
		return pdao.userPostList(user_no);
	}//end
	
	//����Ʈ All
	public List<PostVO> postAll() throws Exception{
		return pdao.postAll();
	}//end
	
	public PostVO postDetail(int post_no) throws Exception{
		return pdao.postDetail(post_no);
	}//end
	
	public void delPost(int post_no)throws Exception { //post ����
		pdao.delPost(post_no);
	}//end
	
	public void modifyPost( PostDTO dto)throws Exception{
		pdao.modifyPost(dto);
	};
	 
	//����Ʈ��ȣ�� post file ��������
	public List<PostFileDTO> postNoToPostFile(int post_no) throws Exception{
		return pdao.postNoToPostFile(post_no);
	}//end
	
	//������ �ð� ǥ���ϱ� ex) ���, 1����, 1�ð��� ...���
	public String postingTime( Date post_reg_date) throws Exception{
		LocalDateTime localDateTime = LocalDateTime.now();
		
		return "1�ð���";
	}//end
	
	//����Ʈ��ȣ�� post like count ��������
	public int postLikesCount(int post_no) throws Exception{
		return pdao.postLikesCount(post_no);
	}//end
	
	//����Ʈ��ȣ, ȸ����ȣ�� post like check �ϱ� -> 1 : ��Ʈ ä���� ǥ��
	public int postLike_check(int post_no, int user_no) throws Exception{
		return pdao.postLike_check(post_no,user_no);
	}//end
	
	public PostDTO postLike_all(PostDTO dto)throws Exception{
		return pdao.postLike_all(dto);
	}//end
	
	public void postLike_insert(PostDTO dto) throws Exception{
		pdao.postLike_insert(dto);
	}//end
	
	
	public int postLike_Search_likeNo(PostDTO dto) throws Exception{
		return pdao.postLike_Search_likeNo(dto);
	}//end
	
	public void postLike_delete(int like_no) throws Exception{
		pdao.postLike_delete(like_no);
	}//end
	
	
	//post_reply 
	public List<PostReplyVO> getReplyAllByPostNo(int post_no) throws Exception{
		return null;
	}//end
}//END
