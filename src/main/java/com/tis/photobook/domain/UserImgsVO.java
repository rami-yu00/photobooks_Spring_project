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
@Alias("UserImgsVO")
public class UserImgsVO {
	
	private MultipartFile file;
	private byte[] byte_fileData;
	private String img_original_name;
	private String user_img_size = "";
	private String user_img_content_type="";
	
	private int user_img_no = 0;
	private int user_no = 0;
	private String user_img_name = "";
	
}//MemberVO END
