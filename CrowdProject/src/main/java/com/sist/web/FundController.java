package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FundController {
	@GetMapping("fund/fund_list.do")
	public String fund_list()
	{
		return "fund/fund_list";
	}
	@GetMapping("fund/fund_detail.do")
	public String fund_detail(int wfno,Model model)
	{
		model.addAttribute("wfno", wfno);
		//model.addAttribute("main_jsp")
		return "fund/fund_detail";
	}
}
