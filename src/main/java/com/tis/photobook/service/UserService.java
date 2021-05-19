package com.tis.photobook.service;

import java.util.List;

import com.tis.photobook.domain.UserFollowVO;
import com.tis.photobook.domain.UserImgsVO;
import com.tis.photobook.domain.UserProfilesVO;
import com.tis.photobook.domain.UsersVO;
import com.tis.photobook.dto.LoginDTO;
import com.tis.photobook.dto.UserFollowDTO;

public interface UserService {

//===========================[ 회원가입 ]===============================
	
	//회원가입 - 등록
	public void register(UsersVO user) throws Exception;
	
	//회원가입 - 이메일 중복확인
	public int isDuplicateEmail(String user_email)throws Exception;
	
	//회원가입 - 아이디 중복확인
	public int isDuplicateId(String user_id)throws Exception;
	
	//로그인 체크
	public UsersVO loginCheck(LoginDTO dto)throws Exception;

//=======================[ 회원가입 프로필 설정 (초기) ]=========================
	//프로필사진 업로드
	public void uploadProfileImg(UserImgsVO uimg)throws Exception;
	
	//프로필 이름&소개 인서트
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception;
	
//==========================[ 회원정보 조회 ]============================		
	// 아이디로 회원정보 조회및 가져오기
	public UsersVO selectUserById(String user_id) throws Exception;
	
	// 회원번호로 회원프로필사진정보 조회및 가져오기
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception;
	
	//회원 번호로 회원전체 정보 조회 (기본정보,프사,이름&소개)
	public UsersVO selectUser(int user_no) throws Exception;
	
	//회원 번호로 전체회원의 정보 조회(기본정보,프사,이름&소개)
	public List<UsersVO> selectUserAll() throws Exception;
	
	//==========================[ 팔로우 ]============================	
	
	//팔로우 체크
	public int checkFollow(UserFollowDTO dto) throws Exception;
	
	//팔로워 리스트
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception;
	
	//팔로잉 리스트
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception;

	//팔로우 add
	public void addFollow(UserFollowDTO dto) throws Exception;
	
	//팔로우 delete
	public void deleteFollow(UserFollowDTO dto) throws Exception ;
}//END
