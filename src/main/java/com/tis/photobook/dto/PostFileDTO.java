package com.tis.photobook.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@ToString
@Alias("PostFileDTO")
public class PostFileDTO {
	//================[post file ������� �ʵ�]====================	
		private int post_file_no;
		private int post_no;
		private String post_file_name;
		private String post_file_thumbnail;
	//================[post file �ΰ����� ������� �ʵ�]====================
		private MultipartFile file =null;
		private byte[] byte_fileData = null;
		private String post_file_original_name = ""; 
		
}
