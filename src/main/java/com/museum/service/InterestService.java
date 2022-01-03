package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IInterestDao;

@Service
public class InterestService {
	
	@Autowired
	IInterestDao interestDao;

}
