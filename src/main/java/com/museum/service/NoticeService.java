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
	INoticeDao ndao;

	public ArrayList<NoticeDto> listNotice(Paging paging, String key) {
		return ndao.listNotice(paging, key);
	}

}
