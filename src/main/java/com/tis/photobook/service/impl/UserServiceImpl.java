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
	
	
	//===========================[ 로그인 ]===============================
	@Override
	public UsersVO loginCheck(LoginDTO dto) throws Exception {
		return udao.loginUser(dto);
	}//end
	
	
	
	
	//===========================[ 회원가입 ]===============================
	@Override //회원가입 - 등록
	public void register(UsersVO user) throws Exception {
		udao.register(user);
	}//end
	
	@Override //회원가입 - 이메일 중복확인
	public int isDuplicateEmail(String user_email) throws Exception {
		return udao.isDuplicateEmail(user_email);
	}//end
	
	@Override //회원가입 - 아이디 중복확인
	public int isDuplicateId(String user_id) throws Exception {
		return udao.isDuplicateId(user_id);
	}//end
	
	
	
	//=======================[ 회원가입 프로필 설정 (초기) ]=========================
	@Override //프로필사진 업로드 
	public void uploadProfileImg(UserImgsVO uimg)throws Exception {
		//UUID생성(Universal Unique IDentifier = 범용고유식별자 )
		String Path = application.getRealPath("/resources/upload/user/");
		UUID uuid = UUID.randomUUID();
		//랜덤생성+파일이름 저장
		logger.info("-------------------------------------------------");
		String saved_name = uuid.toString()+"_"+uimg.getImg_original_name();
		File file = new File(Path, saved_name);
		logger.info("saved user No         : "+ uimg.getUser_no());
		logger.info("saved UUID-File Name  : "+ saved_name);
		uimg.getFile().transferTo(file);
		uimg.setUser_img_name(saved_name);
		udao.insertProfileImg(uimg);
	}//end
	
	@Override //프로필 이름&소개 인서트
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception{
		udao.insertProfileNameAndIntro(upfile);
	}//end
	
	//==========================[ 회원정보 조회 ]============================	
	@Override// 아이디로 회원가입정보 조회및 가져오기
	public UsersVO selectUserById(String user_id) throws Exception{
		return udao.selectUserById(user_id);
	}//end
	
	@Override// 회원번호로 회원프로필사진정보 조회및 가져오기
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception{
		return udao.selectUserImgByNo(user_no);
	}//end
	
	@Override//회원 번호로 회원전체 정보 조회 (기본정보,프사,이름&소개)
	public UsersVO selectUser(int user_no) throws Exception{
		return udao.selectUser(user_no);
	}//end
	
	@Override//회원 번호로 전체회원의 정보 조회(기본정보,프사,이름&소개)
	public List<UsersVO> selectUserAll() throws Exception{
		return udao.selectUserAll();
	}//end
	//==========================[ 팔로우 ]============================	
	
	//팔로우 체크
	public int checkFollow(UserFollowDTO dto) throws Exception{
		return udao.checkFollow(dto);
	}//end
	
	//팔로워 리스트
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception{
		return udao.getFollowerByUserNo(user_no);
	}//end
	
	//팔로잉 리스트
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception{
		return udao.getFollowingByUserNo(user_no);
	}//end
	
	//팔로우 add
	public void addFollow(UserFollowDTO dto) throws Exception {
		udao.addFollow(dto);
	}//end
	
	//팔로우 delete
	public void deleteFollow(UserFollowDTO dto) throws Exception {
		udao.deleteFollow(dto);
	}//end

}//END
