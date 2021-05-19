package com.tis.photobook.domain;

import java.util.Date;

import org.aspectj.lang.annotation.Aspect;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Aspect("PostReplyVO")
@Data
@Setter
@Getter
@ToString
public class PostReplyVO {
	private int reply_no;
	private int post_no;
	private int user_no;
	private String user_id;
	private String user_img_name;
	private String content;
	private Date reply_reg_date;
	
	//paging
	private int rn;
	private int startpage;
	private int endpage;
	
}// Class END
