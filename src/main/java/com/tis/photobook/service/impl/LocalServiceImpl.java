package com.tis.photobook.service.impl;

import java.time.LocalDateTime;
import java.util.Locale;

import org.springframework.stereotype.Service;

import com.tis.photobook.service.LocalService;

@Service
public class LocalServiceImpl implements LocalService{

	@Override
	public String TO_DATE_TIME() {
		LocalDateTime dateTime = LocalDateTime.now();
		return " - "+dateTime;
	}
	

}
