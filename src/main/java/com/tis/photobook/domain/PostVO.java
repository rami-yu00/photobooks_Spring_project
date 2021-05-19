package com.tis.photobook.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.tis.photobook.dto.PostFileDTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@Alias("PostVO")
public class PostVO {
//================[post table 담기위한 필드]====================	
	
	private int user_no;
	private String user_id;
	
	private int user_img_no;
	private String user_img_name;
	
	private int post_no;
	private String post_caption;
	private Date post_reg_date;
	private int post_file_count;
	
//================[post file 담기위한 필드]====================	
	
	private int post_file_no;
	private String post_file_name;
	
//================[post file 부가정보 담기위한 필드]====================
	private MultipartFile file =null;
	private byte[] byte_fileData = null;
	private String post_file_original_name = ""; 
	private String post_file_size = "";
	private String post_file_content_type="";
	private String[] files;

//================[post file list ]===============================
	private List<PostFileDTO> post_file_list;
	
//================[post file list ]===============================
	private int post_likes;
	private int like_check;
	
	private int like_no;
	
//============================================================
	private int like_count;
	private int reply_count;
	
}//END
