package com.museum.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IMemberDao;
import com.museum.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	IMemberDao memberDao;

	public MemberDto getMember(String id) {
		return memberDao.getMember(id);
	}

	public void insertMember(MemberDto memberdto) {
		memberDao.insertMember(memberdto);
		
	}

	public void updateMember(MemberDto memberdto) {
		memberDao.updateMember(memberdto);
		
	}

	public void deleteMember(MemberDto memberdto) {
		memberDao.deleteMember(memberdto);
		
	}
}
