package com.sist.web;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class FundNewsRestController {
	@Autowired
	private MainService service;
	@Autowired
	private FundDAO dao;
	
	@GetMapping(value = "fund/fund_news_vue.do", produces = "text/plain;charset=UTF-8")
	public String fund_news_list(int page, int wfno, int tno) throws Exception {
		Map map = new HashMap();
		int rowSize=8;
		int start = (rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("wfno", wfno);
		map.put("tno", tno);
		String[] tname= {"","결제","교환/환불/AS","이벤트","리워드 안내","기타"};
		List<NewsVO> list = service.fundDetailNewsListData(map);
		for(NewsVO vo:list)
		{
			vo.setTname(tname[vo.getTno()]);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "fund/fund_news_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String news_find_page(int page, int wfno, int tno) throws Exception
	{
		Map map = new HashMap();
		map.put("wfno", wfno);
		map.put("tno", tno);
		int totalpage = service.fundDetailNewsTotalPage(map);
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo = new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		int allpage = service.fundDetailNewsAllPage(map);
		vo.setAllpage(allpage);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "fund/fund_news_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String news_find_page(int no) throws Exception {
		NewsVO vo = dao.makerNewsDetailData(no);
		String[] tname= {"","결제","교환/환불/AS","이벤트","리워드 안내","기타"};
		vo.setTname(tname[vo.getTno()]);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
}
