package com.sist.web;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;


@RestController
public class StoreRestController {
	@Autowired
	private StoreService service;
	@Autowired
	private StoreDAO dao;
	@GetMapping(value="store/store_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String storeListData(int scno) throws Exception
	{
		Map map = new HashMap();
		map.put("scno", scno);
		List<StoreVO> list = service.storeListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	//strparti,strprice,strfollower,strsupporter,strjjim;
	@GetMapping(value="store/store_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String storeDetailData(int wsno) throws Exception
	{
		StoreVO vo = dao.storeDetailData(wsno);
		DecimalFormat df = new DecimalFormat("###,###,###");
		
		String strparti =df.format(vo.getParti_count());
		String strprice = df.format(vo.getPrice());
		String strfollower= df.format(vo.getMaker_follower());
		String strsupporter=df.format(vo.getMaker_supporter());
		String strjjim = df.format(vo.getJjim_count());
		vo.setStrparti(strparti);
		vo.setStrprice(strprice);
		vo.setStrfollower(strfollower);
		vo.setStrsupporter(strsupporter);
		vo.setStrjjim(strjjim);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value="store/store_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String storeRewardList(int wsno) throws Exception
	{
		List<StoreRewardVO> list = dao.storeRewardList(wsno);
		for(StoreRewardVO vo:list)
		{
			DecimalFormat df = new DecimalFormat("###,###,###");
			String strprice = df.format(vo.getRprice());
			vo.setStrrprice(strprice);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);	
		return json;
	}
}
