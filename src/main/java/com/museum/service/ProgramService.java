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
	IProgramDao pdao;

	public ArrayList<ProgramDto> listProgram(Paging paging, String key) {
		return pdao.listProgram(paging, key);
	}

	public ProgramDto getProgram(int num) {
		return pdao.getProgram(num);
	}

	public int getAllCount(String tableName, String fieldName, String key) {
		return pdao.getAllCount(tableName, fieldName, key);
	}
}
