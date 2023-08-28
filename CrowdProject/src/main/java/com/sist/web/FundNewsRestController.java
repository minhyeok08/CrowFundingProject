package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FundNewsRestController {
	@Autowired
	private FundDAO dao;
	
	@GetMapping(value = "fund/fund_newsListData_vue.do",produces = "text/plain;charset=UTF-8")
	public String news_list_data(int wfno) throws Exception
	{
		List<NewsVO> list = dao.NewsDataList(wfno);
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		
        for (NewsVO vo : list) {
            String strRegdate = sdf.format(vo.getRegdate());
            vo.setStrRegdate(strRegdate);
        }
        
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "fund/fund_newsCount_vue.do",produces = "text/plain;charset=UTF-8")
	public String news_count(int wfno) throws Exception
	{	
		int count = dao.NewsDataCount(wfno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(count);
		
		
		return json;
	}
	
	
}
