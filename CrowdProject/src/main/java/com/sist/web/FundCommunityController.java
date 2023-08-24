package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FundCommunityController {
	
	@GetMapping("fund/fund_community.do")
	public String fund_community(int wfno,Model model) {
		model.addAttribute("wfno",wfno);
		return "fund/fund_detail_community";
	}
}
