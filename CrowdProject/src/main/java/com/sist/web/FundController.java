package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FundController {
	@GetMapping("fund/fund_list.do")
	public String fund_list()
	{
		return "fund/fund_list";
	}
}
