package com.tis.photobook.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SearchController {
	

	public ModelAndView search() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/search");
		return mv;
	}//end
	
	
}//end
