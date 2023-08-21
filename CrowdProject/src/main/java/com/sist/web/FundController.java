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
		return "fund/fund_detail";
	}
	@GetMapping("fund/fund_choice.do")
	public String fund_choice(String wfno,Model model)
	{
		int wfno2=(Integer.parseInt(wfno));
		model.addAttribute("wfno", wfno2);
		return "fund/fund_choice";
	}
}
