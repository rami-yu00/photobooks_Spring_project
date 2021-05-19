package com.tis.photobook.domain;

import org.aspectj.lang.annotation.Aspect;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Aspect("UserFollowVO")
@Data
@Setter
@Getter
@ToString
public class UserFollowVO {
	
	private int passive_user_no;
	private int active_user_no;
	private int follow_no;
	
	private String user_id;
	private String user_img_name;
	
}//end
