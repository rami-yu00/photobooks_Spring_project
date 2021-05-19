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
	//================[ ���� object ���� ���� �ʵ� ]====================
	//���� �⺻ ����
	private int user_no = 0;
	private String user_email = "";
	private String user_id = "";
	private String user_pwd = "";
	private java.util.Date user_reg_date = null;
	
	//���� �����ʻ��� �̹���
	private int user_img_no = 0;
	private String user_img_name = "";
	
	//���� ������ �̸�&�Ұ�
	private int user_profile_no = 0;
	private String user_name = "";
	private String user_intro = "";
	
	//���� �Խù�, �ȷο�, �ȷ��� count
	private int post_count;
	private int user_follower;
	private int user_following;

	//================[�̹��� ���� ������� �ʵ�]====================
	private MultipartFile file =null;
	private byte[] byte_fileData = null;
	private String img_original_name = ""; 
	private String user_img_size = "";
	private String user_img_content_type="";
	
	private List<UserFollowVO> followerList;
	private List<UserFollowVO> followingList;
	
}//MemberVO END
