package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.mapper.NoticeMapper;
import com.sist.service.NoticeService;
import com.sist.vo.ReviewVO;

@RestController
public class FundCommunityRestController {
	@Autowired
	private NoticeService service;
//	@GetMapping(value = "fund/fund_review_vue.do",produces = "text/plain;charset=utf-8")
//	public String fund_review() {
//		
//		return "";
//	}
	
	@GetMapping(value = "fund/fund_reviewGet_vue.do", produces = "text/plain;charset=UTF-8")
	public String review_get(int wfno) throws Exception {
		List<ReviewVO> list=service.reviewListData(wfno);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
}
