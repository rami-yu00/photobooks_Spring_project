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
@Alias("LoginDTO")
public class LoginDTO {
	private int user_no;
	private String user_eid;
	private String user_pwd;
	
}//END
