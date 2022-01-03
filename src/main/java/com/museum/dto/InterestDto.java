package com.museum.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class InterestDto 
{
	private int num;
	private String member_id;
	private int program_num;
	private Date writedate;
}
