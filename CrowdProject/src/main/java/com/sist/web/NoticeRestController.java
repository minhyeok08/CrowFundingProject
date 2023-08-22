package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.NoticeService;
import com.sist.vo.NoticeVO;
import com.sist.vo.PageVO;


@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeService service;

	@GetMapping(value = "notice/notice_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_list(String category,int page) throws Exception{
		int start=(page*10)-9;
		int end=(page*10);
		Map map = new HashMap();
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		int totalPage=service.boardTotalPage();
		if(category.equals("all")) {
			list=service.noticeAllListData(map);
		}else {
			list=service.noticeListData(map);
		}
	    
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    
	    return json;
	}
	
	@GetMapping(value = "notice/detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_detail(int wnno) throws Exception {
		NoticeVO vo=service.noticeDetailData(wnno);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "notice/notice_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String fund_page_list(int page) throws Exception {
		
		int totalpage=service.boardTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
}
