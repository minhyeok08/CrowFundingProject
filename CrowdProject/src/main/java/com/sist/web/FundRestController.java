package com.sist.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping(value="fund/fund_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundDetailData(int wfno) throws Exception
	{
		Map map = new HashMap();
		map.put("wfno", wfno);
		FundVO vo = service.fundDetailData(wfno);
		String detailimg = vo.getDetailimg();
		detailimg = detailimg.substring(0,detailimg.indexOf("^"));
		detailimg = detailimg.replace("#", "&");
		vo.setDetailimg(detailimg);
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
}
