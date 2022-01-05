package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.IBookingDao;
import com.museum.dto.BookingDto;
import com.museum.dto.Paging;

@Service
public class BookingService {

	@Autowired
	IBookingDao bookingDao;

	public void insertBooking(BookingDto bookingdto) {
		bookingDao.insertBooking(bookingdto);
	}

	public int getAllCount() {
		return bookingDao.getAllCount();
	}

	public ArrayList<BookingDto> selectBookingAll(String id) {
		return bookingDao.selectBookingAll(id);
	}

	public BookingDto getBooking(int num) {
		return bookingDao.getBooking(num);
	}

	public void updateBoard(BookingDto bookingdto) {
		bookingDao.updateBooking(bookingdto);
		
	}

	public void cancelBooking(int num) {
		bookingDao.cancelBooking(num);
		
	}

}
