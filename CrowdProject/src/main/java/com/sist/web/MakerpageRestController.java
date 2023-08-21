package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class MakerpageRestController {
	@Autowired
	private FundDAO dao;
	@GetMapping(value = "makerpage/project_list_for_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_list_for_reward(int page,String id) throws Exception
	{
		Map map = new HashMap();
		int rowSize=3;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		List<FundVO> list = dao.projectListData(map);
		for(FundVO vo:list)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dbopenday= sdf.format(vo.getOpenday());
			String dbendday=sdf.format(vo.getEndday());
			vo.setStropenday(dbopenday);
			vo.setStrendday(dbendday);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/page_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_list(int page,String id) throws Exception
	{
		int totalpage=dao.projectrewardnoTotalpage(id);
		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "makerpage/project_detail_for_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_detail_for_reward(int wfno) throws Exception
	{
		FundVO vo = dao.projectDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
		int aim_mount = vo.getAim_amount();
		String str_aim_mount= df.format(aim_mount);
		vo.setStr_aim_mount(str_aim_mount);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/project_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_detail_reward(int wfno) throws Exception
	{
		FundVO vo = dao.projectDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
		int aim_mount = vo.getAim_amount();
		String str_aim_mount= df.format(aim_mount);
		vo.setStr_aim_mount(str_aim_mount);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/project_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_list(int page,String id) throws Exception
	{
		Map map = new HashMap();
		int rowSize=3;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		List<FundVO> list = dao.projectListData(map);
		for(FundVO vo:list)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dbopenday= sdf.format(vo.getOpenday());
			String dbendday=sdf.format(vo.getEndday());
			vo.setStropenday(dbopenday);
			vo.setStrendday(dbendday);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/page_Oklist_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_Oklist(int page,String id) throws Exception
	{
		int totalpage=dao.projectrewardOkTotalpage(id);
		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/reward_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_list(int wfno) throws Exception
	{
		List<RewardVO> list = dao.rewardListData(wfno);
		for(RewardVO vo:list)
		{
			DecimalFormat df = new DecimalFormat("###,###,###");
			String strrprice= df.format(vo.getRprice())+"원";
			vo.setStrrprice(strrprice);
			if(vo.getDelfee()!=0)
			{
				String strdelfee= df.format(vo.getDelfee())+"원";
				vo.setStrdelfee(strdelfee);
			}
			else
			{
				vo.setStrdelfee("무료배송");
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/reward_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_detail(int rno) throws Exception
	{
		RewardVO vo = dao.reward_detail(rno);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/reward_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_delete(int rno,int wfno) throws Exception
	{
		dao.reward_delete(rno);
		List<RewardVO> list = dao.rewardListData(wfno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
}	