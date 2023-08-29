package com.sist.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

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
	private MyPageService mpservice;
	@Autowired
	private MainService mservice;
	@Autowired
	private FundDAO dao;
	@Autowired
	private NoticeService nservice;
	
	@GetMapping(value="fund/fund_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String fundListData(int fcno) throws Exception
	{	
		Map map = new HashMap();
		map.put("fcno", fcno);
		List<FundVO> list = service.fundListData(map);
		for(FundVO vo:list)
		{
			DecimalFormat df = new DecimalFormat("###,###,###");
			String str_cum_amount = df.format(vo.getCum_amount());
			String str_achieve_rate = df.format(vo.getAchieve_rate());
			
			vo.setStr_achieve_rate(str_achieve_rate);
			vo.setStr_cum_amount(str_cum_amount);
			String ftitle = vo.getFtitle();
			if(ftitle.length()>33)
			{
				ftitle = ftitle.substring(0,33)+"...";
			}
			vo.setFtitle(ftitle);
		}
			
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
			
			map = new HashMap();
			// 랭킹 갱신용 (조회시 스코어 1증가)
			map.put("wfno", wfno);
			map.put("score", 5);
			mservice.fundRankUpdate(map);
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(jjim_ok);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value = "fund/fund_buy_fundData_vue.do", produces = "text/plain;charset=UTF-8")
	public String buyFundData(int wfno) throws Exception {
		FundVO vo = service.fundDetailData(wfno);
		
		ObjectMapper mapper=new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "fund/fund_buy_rewardData_vue.do", produces = "text/plain;charset=UTF-8")
	public String buyRewardData(int rno) throws Exception  {
		FundRewardVO rvo = service.fundBuyData(rno);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(rvo);
		
		return json;
	}
	
	@GetMapping(value = "fund/fund_buy_memberData_vue.do", produces = "text/plain;charset=UTF-8")
	public String buyMemberData(String id) throws Exception  {
		MemberVO mvo = mpservice.myInfo(id);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(mvo);
		
		return json;
	}
	@PostMapping(value="fund/fund_jiji_vue.do",produces = "text/plain;charset=UTF-8")
	   public void fundJiji(@RequestParam int wfno, @RequestParam String message, HttpSession session)
	   {
	      String id = (String)session.getAttribute("id");
	      ReviewVO rvo = new ReviewVO();
	      rvo.setWfno(wfno);
	      rvo.setContent(message);
	      rvo.setId(id);
	      rvo.setCategory("지지");

			Map map = new HashMap();
			map.put("wfno", wfno);
			map.put("score", 10);
			mservice.fundRankUpdate(map);
	      nservice.reviewInsert(rvo);
	      dao.fundSupIncrement(wfno);
	      
	      
	   }
}
