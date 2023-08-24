package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.WastaDAO;
import com.sist.vo.ReviewVO;

@RestController
public class WastaRestController {
	@Autowired
	private WastaDAO dao;
	
	@GetMapping(value = "wasta/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String wasta_list() throws Exception {
		List<ReviewVO> list=dao.wastaReviewListData();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "wasta/friend_vue.do", produces = "text/plain;charset=UTF-8")
	public String friend_list() throws Exception {
		List<ReviewVO> list=dao.wastaFriendListData();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
}
