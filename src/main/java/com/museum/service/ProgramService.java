package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IProgramDao;
import com.museum.dto.Paging;
import com.museum.dto.ProgramDto;

@Service
public class ProgramService {
	
	@Autowired
	IProgramDao programDao;

	public ArrayList<ProgramDto> listProgram(Paging paging, String key) {
		return programDao.listProgram(paging, key);
	}

	public ProgramDto getProgram(int num) {
		return programDao.getProgram(num);
	}

	public int getAllCount(String tableName, String fieldName, String key) {
		return programDao.getAllCount(tableName, fieldName, key);
	}

	public String getProgram() {
		return null;
	}

}