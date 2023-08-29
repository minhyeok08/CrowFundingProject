package com.sist.web;
import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.dao.*;
@RestController
@CrossOrigin("*")
public class MainRestController {
	@Autowired
	private MainService service;
	@Autowired
	private WastaDAO wdao;
	
	@GetMapping(value = "main/store_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdStoreListData() throws Exception {
		
		List<StoreVO> list = service.crowdStoreListData();
		
		for(StoreVO vo:list)
		{
			String goods_title = vo.getGoods_title();
			if(goods_title.length()>30)
			{
				goods_title = goods_title.substring(0,30)+"...";
			}
			vo.setGoods_title(goods_title);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "main/fund_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdFundListData(HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		List<FundVO> list = new ArrayList<FundVO>();
		
		if (id != null) {
			String fcname = service.crowdTasteFcname(id);
			if (fcname != null) {
				list = service.crowdTasteFundListData(fcname);
			} else {
				list = service.crowdFundListData();
			}
		} else {
			list = service.crowdFundListData();
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "main/fund_rank_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String fundRankListData() throws Exception {
		List<FundVO> list = service.fundRankListData();
		
		if(list.size() < 6) {
			list = service.crowdFundListData();
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "main/friend_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String friendListData() throws Exception {
		List<ReviewVO> list = wdao.wastaReviewListData();
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
}
