package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IVocDao;
import com.museum.dto.Paging;
import com.museum.dto.VocDto;

@Service
public class VocService {
	
	@Autowired
	IVocDao vocDao;

	public ArrayList<VocDto> listVoc(Paging paging, String key) {
		return vocDao.listVoc(paging, key);
	}

}
