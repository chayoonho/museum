package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.INoticeDao;
import com.museum.dto.NoticeDto;
import com.museum.dto.Paging;

@Service
public class NoticeService {
	
	@Autowired
	INoticeDao noticeDao;

	public ArrayList<NoticeDto> listNotice(Paging paging, String key) {
		return noticeDao.listNotice(paging, key);
	}

	public NoticeDto getNotice(int num) {
		noticeDao.plusReadCount(num);
		return noticeDao.getNotice(num);
	}


}
