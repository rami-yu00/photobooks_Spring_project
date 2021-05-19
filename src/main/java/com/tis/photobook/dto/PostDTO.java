package com.tis.photobook.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@ToString
@Alias("PostDTO")
public class PostDTO {
	private String post_caption;
	private int post_file_count;
	private int post_no;
	private int user_no;
	
	//pb_like talble data
	private int like_no;
}//END
