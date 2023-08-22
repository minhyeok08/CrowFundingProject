package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.dao.*;
@RestController
public class MainRestController {
	@Autowired
	private MainService service;
	
	@GetMapping(value = "main/store_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdStoreListData() throws Exception {
		
		List<CrowdStoreVO> list = service.crowdStoreListData();

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "main/fund_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdFundListData() throws Exception {
		
		List<CrowdFundVO> list = service.crowdFundListData();
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
}
