package com.tis.photobook.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@Alias("UsersVO")
public class UsersVO {
	//================[ 유저 object 세션 저장 필드 ]====================
	//유저 기본 정보
	private int user_no = 0;
	private String user_email = "";
	private String user_id = "";
	private String user_pwd = "";
	private java.util.Date user_reg_date = null;
	
	//유저 프로필사진 이미지
	private int user_img_no = 0;
	private String user_img_name = "";
	
	//유저 프로필 이름&소개
	private int user_profile_no = 0;
	private String user_name = "";
	private String user_intro = "";
	
	//유저 게시물, 팔로워, 팔로잉 count
	private int post_count;
	private int user_follower;
	private int user_following;

	//================[이미지 정보 담기위한 필드]====================
	private MultipartFile file =null;
	private byte[] byte_fileData = null;
	private String img_original_name = ""; 
	private String user_img_size = "";
	private String user_img_content_type="";
	
	private List<UserFollowVO> followerList;
	private List<UserFollowVO> followingList;
	
}//MemberVO END
