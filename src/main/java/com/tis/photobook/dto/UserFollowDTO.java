package com.tis.photobook.dto;

import org.aspectj.lang.annotation.Aspect;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Aspect("UserFollowDTO")
@Data
@Setter
@Getter
@ToString
public class UserFollowDTO {

	private int passive_user_no;
	private int active_user_no;
	private int follow_no;
	
}//end
