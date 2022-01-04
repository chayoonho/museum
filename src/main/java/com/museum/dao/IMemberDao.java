package com.museum.dao;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.MemberDto;

@Mapper
public interface IMemberDao {

	MemberDto getMember(String id);
	void insertMember(MemberDto memberdto);
	void updateMember(MemberDto memberdto);
	void deleteMember(MemberDto memberdto);

}
