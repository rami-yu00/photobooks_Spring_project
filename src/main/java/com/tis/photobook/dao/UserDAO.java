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
	//===========================[ 로그인 ]===============================
	public UsersVO loginUser(LoginDTO dto) throws Exception {
		return temp.selectOne("users.loginUser", dto); 
	}//end
	
	
	//===========================[ 회원가입 ]===============================
	//회원가입 - 등록
	public void register(UsersVO user) throws Exception {
		temp.insert("users.register", user);
	}
	
	//회원가입 - 이메일 중복확인
	public int isDuplicateEmail(String user_email) throws Exception  {
		return temp.selectOne("users.isDuplicateEmail", user_email );
	}
	
	//회원가입 - 아이디 중복확인
	public int isDuplicateId(String user_id) throws Exception  {
		return temp.selectOne("users.isDuplicateId", user_id );
	}
	//=======================[ 회원가입 프로필 설정 (초기) ]=========================
	//프로필사진 업로드
	public void insertProfileImg(UserImgsVO uimg) throws Exception {
		temp.insert("users.insertProfileImg", uimg);
	};
	//프로필 이름&소개 인서트
	public void insertProfileNameAndIntro(UserProfilesVO upfile)throws Exception{
		temp.insert("users.insertProfileNameAndIntro", upfile);
	};
	
	//==========================[ 회원정보 조회 ]============================	
	// 아이디로 회원정보 조회및 가져오기
	public UsersVO selectUserById(String user_id) throws Exception{
		return temp.selectOne("users.selectUserById", user_id);
	}//end
	
	// 회원번호로 회원프로필사진정보 조회및 가져오기
	public UserImgsVO selectUserImgByNo(int user_no) throws Exception{
		return temp.selectOne("users.selectUserImgByNo", user_no);
	}//end
	
	//회원 번호로 회원전체 정보 조회 (기본정보,프사,이름&소개)
	public UsersVO selectUser(int user_no) throws Exception{
		return temp.selectOne("users.selectUser", user_no);
	}//end
	
	//회원 번호로 전체회원의 정보 조회(기본정보,프사,이름&소개)
	public List<UsersVO> selectUserAll() throws Exception{
		return temp.selectList("users.selectUser");
	}//end
	
	//==========================[ 팔로우 ]============================	
	//팔로우 체크
	public int checkFollow(UserFollowDTO dto) throws Exception{
		return temp.selectOne("users.checkFollow", dto);
	}//end
	
	//팔로워 리스트
	public List<UserFollowVO> getFollowerByUserNo(int user_no) throws Exception{
		return temp.selectList("users.getFollowerByUserNo", user_no);
	}//end
	
	//팔로잉 리스트
	public List<UserFollowVO> getFollowingByUserNo(int user_no) throws Exception{
		return temp.selectList("users.getFollowingByUserNo", user_no);
	}//end
	
	//팔로우 add
	public void addFollow(UserFollowDTO dto) throws Exception {
		temp.insert("users.addFollow", dto);
	}//end
	
	//팔로우 delete
	public void deleteFollow(UserFollowDTO dto) throws Exception {
		temp.delete("users.deleteFollow", dto);
	}//end
}//END
