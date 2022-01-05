package com.museum.service;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IVocDao;
import com.museum.dto.VocDto;

@Service
public class VocService {
	
	@Autowired
	IVocDao vocDao;

	public void insertVoc(VocDto vocdto) {
		vocDao.insertVoc(vocdto);
		
	}

	public VocDto getVoc(int num) {
		return vocDao.getVoc(num);
	}

	public ArrayList<VocDto> listVoc(String id) {
		return vocDao.listVoc(id);
	}

}
