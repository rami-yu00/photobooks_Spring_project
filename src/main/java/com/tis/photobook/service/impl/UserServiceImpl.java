package com.tis.photobook.service.impl;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tis.photobook.dao.UserDAO;
import com.tis.photobook.domain.UserFollowVO;
import com.tis.photobook.domain.UserImgsVO;
import com.tis.photobook.domain.UserProfilesVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.LoginDTO;
import com.tis.photobook.dto.UserFollowDTO;
import com.tis.photobook.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	@Autowired
	UserDAO udao;
	
	@Inject
	@Autowired
	ServletContext application;
	
	
	//===========================[ �α��� ]===============================
	@Override
	public UsersVO loginCheck(LoginDTO dto) throws Exception {
		return udao.loginUser(dto);
	}//end
	
	
	
	
	//===========================[ ȸ������ ]===============================
	@Override //ȸ������ - ���
	public void register(UsersVO user) throws Exception {
		udao.register(user);
	}//end
	
	@Override //ȸ������ - �̸��� �ߺ�Ȯ��
	public int isDuplicateEmail(String user_email) throws Exception {
		return udao.isDuplicateEmail(user_email);
	}//end
	
	@Override //ȸ������ - ���̵� �ߺ�Ȯ��
	public int isDuplicateId(String user_id) throws Exception {
		return udao.isDuplicateId(user_id);
	}//end
	
	
	
	//=======================[ ȸ������ ������ ���� (�ʱ�) ]=========================
	@Override //�����ʻ��� ���ε� 
	public void uploadProfileImg(UserImgsVO uimg)throws Exception {
		//UUID����(Universal Unique IDentifier = ��������ĺ��� )
		String Path = application.getRealPath("/resources/upload/user/");
		UUID uuid = UUID.randomUUID();
		//��������+�����̸� ����
		logger.info("-------------------------------------------------");
		String saved_name = uuid.toString()+"_"+uimg.getImg_original_name();
		File file = new File(Path, saved_name);
		logger.info("saved user No         : "+ uimg.getUser_no());
		logger.info("saved UUID-File Name  : "+ saved_name);
		uimg.getFile().transferTo(file);
		uimg.setUser_img_name(saved_name);
		udao.insertProfileImg(uimg);
	}//end
	
	@Override //������ �̸�&�Ұ� �μ�Ʈ
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception{
		udao.insertProfileNameAndIntro(upfile);
	}//end
	
	//==========================[ ȸ������ ��ȸ ]============================	
	@Override// ���̵�� ȸ���������� ��ȸ�� ��������
	public UsersVO selectUserById(String user_id) throws Exception{
		return udao.selectUserById(user_id);
	}//end
	
	@Override// ȸ����ȣ�� ȸ�������ʻ������� ��ȸ�� ��������
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception{
		return udao.selectUserImgByNo(user_no);
	}//end
	
	@Override//ȸ�� ��ȣ�� ȸ����ü ���� ��ȸ (�⺻����,����,�̸�&�Ұ�)
	public UsersVO selectUser(int user_no) throws Exception{
		return udao.selectUser(user_no);
	}//end
	
	@Override//ȸ�� ��ȣ�� ��üȸ���� ���� ��ȸ(�⺻����,����,�̸�&�Ұ�)
	public List<UsersVO> selectUserAll() throws Exception{
		return udao.selectUserAll();
	}//end
	//==========================[ �ȷο� ]============================	
	
	//�ȷο� üũ
	public int checkFollow(UserFollowDTO dto) throws Exception{
		return udao.checkFollow(dto);
	}//end
	
	//�ȷο� ����Ʈ
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception{
		return udao.getFollowerByUserNo(user_no);
	}//end
	
	//�ȷ��� ����Ʈ
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception{
		return udao.getFollowingByUserNo(user_no);
	}//end
	
	//�ȷο� add
	public void addFollow(UserFollowDTO dto) throws Exception {
		udao.addFollow(dto);
	}//end
	
	//�ȷο� delete
	public void deleteFollow(UserFollowDTO dto) throws Exception {
		udao.deleteFollow(dto);
	}//end

}//END
