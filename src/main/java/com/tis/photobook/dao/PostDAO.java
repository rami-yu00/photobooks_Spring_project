package com.tis.photobook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.domain.PostVO;
import com.tis.photobook.dto.PostDTO;
import com.tis.photobook.dto.PostFileDTO;

@Component
@Repository
public class PostDAO {
	
	@Autowired
	SqlSessionTemplate tmp;
	
	public void insertPost(PostDTO post) { //post insert
		tmp.insert("post.insertPost",post);
	}//end
	
	public int selectPostNo(PostDTO post) { //post번호가져오기
		return tmp.selectOne("post.selectPostNo",post); 
	}//end
	
	public void delPost(int post_no) { //post 삭제
		tmp.delete("post.delPost", post_no);
	}//end
	
	public void modifyPost( PostDTO dto)throws Exception{
		tmp.update("post.modifyPost", dto);
	};
	
	public void insertPostFile(PostFileDTO fpost) { //postFile insert
		tmp.insert("post.insertPostFile",fpost);
	}//end
	
	public List<PostVO> userPostList(int user_no){
		return tmp.selectList("post.userPostList", user_no);
	}//end
	
	public List<PostVO> postAll() throws Exception{
		return tmp.selectList("post.postAll");
	}//end
	
	public PostVO postDetail(int post_no) throws Exception{
		return tmp.selectOne("post.postDetail", post_no);
	}//end
	
	public List<PostFileDTO> postNoToPostFile(int post_no){
		return tmp.selectList("post.postNoToPostFile", post_no);
	}//end
	
	public int postLikesCount(int post_no) throws Exception{
		return tmp.selectOne("post.postLikesCount",post_no); 
	}//end
	
	public int postLike_check(int post_no, int user_no) throws Exception{
		PostDTO pdto = new PostDTO();
		pdto.setPost_no(post_no);
		pdto.setUser_no(user_no);
		return tmp.selectOne("post.postLikesCheck",pdto);
	}//end
	
	public PostDTO postLike_all(PostDTO dto )throws Exception{
		return tmp.selectOne("post.postLikeAll", dto);
	}//end
	
	public void postLike_insert(PostDTO dto) throws Exception{
		
		tmp.selectOne("post.likeInsert",dto);
	}//end
	
	public int postLike_Search_likeNo(PostDTO dto) throws Exception{
		return tmp.selectOne("post.likeSearch",dto);
	}//end
	
	public void postLike_delete(int like_no) throws Exception{
		tmp.selectOne("post.likeDelete",like_no);
	}//end
	
	
	
}//END
