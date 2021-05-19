package com.tis.photobook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;

@Component
@Repository
public class PostReplyDAO {
	
	@Autowired
	SqlSessionTemplate tmp;
	
	//post_reply
	public List<PostReplyVO> getReplyAllByPostNo(int post_no) throws Exception{
		return tmp.selectList("post_reply.getReplyAllByPostNo", post_no);
	}//end
	
	//post_reply
	public List<PostReplyVO> getReplyAllByPostNoDESC(int post_no) throws Exception{
		return tmp.selectList("post_reply.getReplyAllByPostNoDESC", post_no);
	}//end
	
	public void addReply(PostReplyDTO dto) throws Exception{
		tmp.insert("post_reply.addReply", dto);
	}//end
	
	public void delReply(int reply_no)throws Exception{
		tmp.delete("post_reply.delReply", reply_no);
	}//end
	
	public void modifyReply(PostReplyDTO dto)throws Exception{
		tmp.update("post_reply.modifyReply",dto);
	}//end
	
}
