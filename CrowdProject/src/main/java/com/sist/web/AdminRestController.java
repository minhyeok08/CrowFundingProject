package com.sist.web;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.AdminService;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.PageVO;

@RestController
public class AdminRestController {
	@Autowired
	private AdminService service;
	
	@GetMapping(value = "admin/store_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String storeListData(int curpage, int scno) throws Exception {
		
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("scno", scno);
		map.put("start", start);
		map.put("end", end);
		int totalpage=service.storeTotalPage();
		List<CrowdStoreVO> list = service.crowdStoreListData(map);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/store_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_list(int page) throws Exception {
		
		int totalpage=service.storeTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "admin/fund_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String fundListData(int curpage, int fcno) throws Exception {
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("fcno", fcno);
		map.put("start", start);
		map.put("end", end);
		int totalpage=service.fundTotalPage();
		List<CrowdFundVO> list = service.crowdFundListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
}
