package com.museum.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IMemberDao;
import com.museum.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	public MemberDto getMember(String id) {
		return mdao.getMember(id);
	}

	public void insertMember(MemberDto memberdto) {
		mdao.insertMember(memberdto);
		
	}

	public void updateMember(MemberDto memberdto) {
		mdao.updateMember(memberdto);
		
	}

	public void deleteMember(MemberDto memberdto) {
		mdao.deleteMember(memberdto);
		
	}
}
