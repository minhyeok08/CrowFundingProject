package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class FundSupController {

	@Autowired
	private FundDAO dao;
	
	@GetMapping("fund/fund_sup.do")
	public String fund_sup(int wfno,Model model)
	{
		//List<SupVO> list = dao.SupListData(wfno);
		model.addAttribute("wfno",wfno);
		
		return "fund/fund_detail_sup";
	}
	
}
