package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.museum.dto.BookingDto;
import com.museum.dto.Paging;

@Mapper
public interface IBookingDao {

	void insertBooking(BookingDto bookingdto);

	int listProgram();

	int getAllCount();

	ArrayList<BookingDto> selectBookingAll(Paging paging);

	ArrayList<BookingDto> selectBookingAll(String id);

	BookingDto getBooking(int num);

	void updateBooking(BookingDto bookingdto);

	void cancelBooking(int num);

}
