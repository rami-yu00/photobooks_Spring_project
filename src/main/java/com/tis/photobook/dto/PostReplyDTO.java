package com.tis.photobook.dto;

import org.aspectj.lang.annotation.Aspect;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Aspect("PostReplyDTO")
@Data
@Getter
@Setter
@ToString
public class PostReplyDTO {
	private int reply_no;
	private int post_no;
	private int user_no;
	private String content;
	
	//∆‰¿Ã¬°
	private int start;
	private int end;
	
	
}// class END
