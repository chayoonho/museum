package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IExhibitionDao;
import com.museum.dto.ExhibitionDto;
import com.museum.util.Paging;

@Service
public class ExhibitionService {
	
	@Autowired
	IExhibitionDao exhbnDao;
	
	public int getAllCount(String kind) 
	{
		return exhbnDao.getAllCount(kind);
	}
	
	public ArrayList<ExhibitionDto> getExhbnSpList(Paging paging, String kind) 
	{
		return exhbnDao.getExhbnSpList(paging, kind);
	}
	

	public ExhibitionDto getExhbnSp(int num) 
	{
		return exhbnDao.getExhbnSp(num);
	}
}
