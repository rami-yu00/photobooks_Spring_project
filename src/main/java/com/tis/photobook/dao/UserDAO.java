package com.tis.photobook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.tis.photobook.domain.UserFollowVO;
import com.tis.photobook.domain.UserImgsVO;
import com.tis.photobook.domain.UserProfilesVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.LoginDTO;
import com.tis.photobook.dto.UserFollowDTO;

@Component
@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	//===========================[ �α��� ]===============================
	public UsersVO loginUser(LoginDTO dto) throws Exception {
		return temp.selectOne("users.loginUser", dto); 
	}//end
	
	
	//===========================[ ȸ������ ]===============================
	//ȸ������ - ���
	public void register(UsersVO user) throws Exception {
		temp.insert("users.register", user);
	}
	
	//ȸ������ - �̸��� �ߺ�Ȯ��
	public int isDuplicateEmail(String user_email) throws Exception  {
		return temp.selectOne("users.isDuplicateEmail", user_email );
	}
	
	//ȸ������ - ���̵� �ߺ�Ȯ��
	public int isDuplicateId(String user_id) throws Exception  {
		return temp.selectOne("users.isDuplicateId", user_id );
	}
	//=======================[ ȸ������ ������ ���� (�ʱ�) ]=========================
	//�����ʻ��� ���ε�
	public void insertProfileImg(UserImgsVO uimg) throws Exception {
		temp.insert("users.insertProfileImg", uimg);
	};
	//������ �̸�&�Ұ� �μ�Ʈ
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception{
		temp.insert("users.insertProfileNameAndIntro", upfile);
	};
	
	//==========================[ ȸ������ ��ȸ ]============================	
	// ���̵�� ȸ������ ��ȸ�� ��������
	public UsersVO selectUserById(String user_id) throws Exception{
		return temp.selectOne("users.selectUserById", user_id);
	}//end
	
	// ȸ����ȣ�� ȸ�������ʻ������� ��ȸ�� ��������
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception{
		return temp.selectOne("users.selectUserImgByNo", user_no);
	}//end
	
	//ȸ�� ��ȣ�� ȸ����ü ���� ��ȸ (�⺻����,����,�̸�&�Ұ�)
	public UsersVO selectUser(int user_no) throws Exception{
		return temp.selectOne("users.selectUser", user_no);
	}//end
	
	//ȸ�� ��ȣ�� ��üȸ���� ���� ��ȸ(�⺻����,����,�̸�&�Ұ�)
	public List<UsersVO> selectUserAll() throws Exception{
		return temp.selectList("users.selectUser");
	}//end
	
	//==========================[ �ȷο� ]============================	
	//�ȷο� üũ
	public int checkFollow(UserFollowDTO dto) throws Exception{
		return temp.selectOne("users.checkFollow", dto);
	}//end
	
	//�ȷο� ����Ʈ
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception{
		return temp.selectList("users.getFollowerByUserNo", user_no);
	}//end
	
	//�ȷ��� ����Ʈ
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception{
		return temp.selectList("users.getFollowingByUserNo", user_no);
	}//end
	
	//�ȷο� add
	public void addFollow(UserFollowDTO dto) throws Exception {
		temp.insert("users.addFollow", dto);
	}//end
	
	//�ȷο� delete
	public void deleteFollow(UserFollowDTO dto) throws Exception {
		temp.delete("users.deleteFollow", dto);
	}//end
}//END
