package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.NoticeDto;
import com.museum.dto.Paging;

@Mapper
public interface INoticeDao {

	ArrayList<NoticeDto> listNotice(Paging paging, String key);

}
