package com.tis.photobook.domain;

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
@Alias("UserProfilesVO")
public class UserProfilesVO {
	
	private String user_id = "";
	
	private int user_profile_no = 0;
	private int user_no = 0;
	private String user_name = "";
	private String user_intro = "";
	
}//MemberVO END
