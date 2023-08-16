package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class FundRestController {
	@Autowired
	private FundService service;
	@Autowired
	private FundDAO dao;
	
	@GetMapping(value="fund/fund_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundListData(int fcno) throws Exception
	{
		Map map = new HashMap();
		map.put("fcno", fcno);
		List<FundVO> list = service.fundListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
}
