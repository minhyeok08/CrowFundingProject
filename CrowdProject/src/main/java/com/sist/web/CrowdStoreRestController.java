package com.sist.web;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class CrowdStoreRestController {
	@Autowired
	private CrowdStoreDAO dao;
	
	@GetMapping(value = "crowd/store_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowd_store_list_vue(String page) {
		String result = "";
		try {
			if (page==null)
				page="1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			map.put("start", (curpage*9)-8);
			map.put("end", curpage*9);
			List<CrowdStoreVO> list = dao.crowdStoreListData(map);
			int totalpage = dao.crowdStoreTotalPage();
			
			JSONArray arr = new JSONArray();
			int i=0;
			for (CrowdStoreVO vo:list) {
				JSONObject obj = new JSONObject();
				obj.put("wsno", vo.getWsno());
				String goods_title = vo.getGoods_title();
				if (vo.getGoods_title().length() >= 40) {
					goods_title = goods_title.substring(0, 40) + "...";
				}
				obj.put("goods_title", goods_title);
				obj.put("score", vo.getScore());
				obj.put("main_poster", vo.getMain_poster());
				obj.put("maker_name", vo.getMaker_name());
				obj.put("price", vo.getPrice());
				if (i==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				i++;
			}
			result = arr.toJSONString();
		} catch (Exception e) {}
		
		return result;
	}
}
