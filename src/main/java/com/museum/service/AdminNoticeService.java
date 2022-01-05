package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IAdminNoticeDao;

@Service
public class AdminNoticeService {

	@Autowired
	IAdminNoticeDao adminNoticeDao; 
}
