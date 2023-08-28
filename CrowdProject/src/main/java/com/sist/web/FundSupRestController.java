package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.FundDAO;
import com.sist.vo.SupVO;

@RestController
public class FundSupRestController {
	@Autowired
	private FundDAO dao;
	
	@GetMapping(value="fund/fund_sup_vue.do",produces = "text/plain;charset=UTF-8")
	public String fund_sup(int wfno) throws Exception
	{
		List<SupVO> list = dao.SupListData(wfno);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
		
		
	}
	
}
