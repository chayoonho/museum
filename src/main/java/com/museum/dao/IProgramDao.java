package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.Paging;
import com.museum.dto.ProgramDto;

@Mapper
public interface IProgramDao {

	ArrayList<ProgramDto> listProgram(Paging paging, String key);
	ProgramDto getProgram(int num);
	int getAllCount(String tableName, String fieldName, String key);

}
