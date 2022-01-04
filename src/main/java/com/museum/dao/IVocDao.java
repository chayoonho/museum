package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.Paging;
import com.museum.dto.VocDto;

@Mapper
public interface IVocDao {

	ArrayList<VocDto> listVoc(Paging paging, String key);

}
