package com.tis.photobook.service;

import java.util.List;

import com.tis.photobook.domain.UserFollowVO;
import com.tis.photobook.domain.UserImgsVO;
import com.tis.photobook.domain.UserProfilesVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.LoginDTO;
import com.tis.photobook.dto.UserFollowDTO;

public interface UserService {

//===========================[ ȸ������ ]===============================
	
	//ȸ������ - ���
	public void register(UsersVO user) throws Exception;
	
	//ȸ������ - �̸��� �ߺ�Ȯ��
	public int isDuplicateEmail(String user_email)throws Exception;
	
	//ȸ������ - ���̵� �ߺ�Ȯ��
	public int isDuplicateId(String user_id)throws Exception;
	
	//�α��� üũ
	public UsersVO loginCheck(LoginDTO dto)throws Exception;

//=======================[ ȸ������ ������ ���� (�ʱ�) ]=========================
	//�����ʻ��� ���ε�
	public void uploadProfileImg(UserImgsVO uimg)throws Exception;
	
	//������ �̸�&�Ұ� �μ�Ʈ
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception;
	
//==========================[ ȸ������ ��ȸ ]============================		
	// ���̵�� ȸ������ ��ȸ�� ��������
	public UsersVO selectUserById(String user_id) throws Exception;
	
	// ȸ����ȣ�� ȸ�������ʻ������� ��ȸ�� ��������
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception;
	
	//ȸ�� ��ȣ�� ȸ����ü ���� ��ȸ (�⺻����,����,�̸�&�Ұ�)
	public UsersVO selectUser(int user_no) throws Exception;
	
	//ȸ�� ��ȣ�� ��üȸ���� ���� ��ȸ(�⺻����,����,�̸�&�Ұ�)
	public List<UsersVO> selectUserAll() throws Exception;
	
	//==========================[ �ȷο� ]============================	
	
	//�ȷο� üũ
	public int checkFollow(UserFollowDTO dto) throws Exception;
	
	//�ȷο� ����Ʈ
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception;
	
	//�ȷ��� ����Ʈ
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception;

	//�ȷο� add
	public void addFollow(UserFollowDTO dto) throws Exception;
	
	//�ȷο� delete
	public void deleteFollow(UserFollowDTO dto) throws Exception ;
}//END
