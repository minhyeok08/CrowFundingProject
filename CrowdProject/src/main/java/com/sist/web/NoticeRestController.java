package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;


@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeDAO dao;

	@GetMapping(value = "notice/notice_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_list(String category,String page) throws Exception{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int start=(curpage*10)-9;
		int end=(curpage*10);
		Map map = new HashMap();
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		int totalPage=dao.boardTotalPage();
		
		List<NoticeVO> list=dao.noticeListData(map);
		
	    
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    
	    return json;
	}
	
	@GetMapping(value = "notice/detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_detail(int wnno) throws Exception {
		NoticeVO vo=dao.noticeDetailData(wnno);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
}
