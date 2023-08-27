package com.sist.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
@CrossOrigin("*")
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
	
	@GetMapping(value="fund/open_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String openListData(int fcno) throws Exception
	{
		Map map = new HashMap();
		map.put("fcno", fcno);
		List<FundVO> list = dao.openListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value="fund/fund_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundDetailData(int wfno) throws Exception
	{
		Map map = new HashMap();
		map.put("wfno", wfno);
		FundVO vo = service.fundDetailData(wfno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		return json;
	}
	
	
	@GetMapping(value="fund/fund_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundRewardList(int wfno) throws Exception
	{
		Map map = new HashMap();
		map.put("wfno", wfno);
		List<FundRewardVO> list = service.fundRewardList(wfno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value="fund/fund_jjim_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundJjim(int wfno, String id) {
		Map map = new HashMap();
		map.put("wfno", wfno);
		map.put("id", id);
		
		// 찜 여부 확인
		int jjim_ok=dao.fundJjimCount(map);
		
		String json="";
		try {
			if(jjim_ok==0) {
				dao.fundJjimInsert(map);
			} else {
				dao.fundJjimCancel(map);
			}
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(jjim_ok);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
}
