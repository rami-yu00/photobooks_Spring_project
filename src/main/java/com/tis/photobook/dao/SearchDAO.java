package com.tis.photobook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;

@Component
@Repository
public class SearchDAO {
	
	@Autowired
	SqlSessionTemplate tmp;
	
	
	
}
