package com.tis.photobook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tis.photobook.dao.PostReplyDAO;
import com.tis.photobook.dao.SearchDAO;
import com.tis.photobook.domain.PostReplyVO;
import com.tis.photobook.dto.PostReplyDTO;
import com.tis.photobook.service.PostReplyService;
import com.tis.photobook.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	SearchDAO sdao;

}//end
