package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.ExhibitionDto;
import com.museum.dto.Paging;

@Mapper
public interface IExhibitionDao {
	
	public int getAllCount(String kind);
	ArrayList<ExhibitionDto> getExhbnSpList(Paging paging, String kind);
	ExhibitionDto getExhbnSp(int num);
}
