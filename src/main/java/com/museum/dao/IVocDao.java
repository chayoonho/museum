package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.VocDto;

@Mapper
public interface IVocDao {

	void insertVoc(VocDto vocdto);
	VocDto getVoc(int num);
	ArrayList<VocDto> listVoc(String id);

}
