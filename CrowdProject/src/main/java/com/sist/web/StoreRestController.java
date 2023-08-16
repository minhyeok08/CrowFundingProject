package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;


@RestController
public class StoreRestController {
	@Autowired
	private StoreService service;
	@Autowired
	private StoreDAO dao;
	
	@GetMapping(value="store/store_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String storeListData(int scno) throws Exception
	{
		Map map = new HashMap();
		map.put("scno", scno);
		List<StoreVO> list = service.storeListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
}
