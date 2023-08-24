package com.sist.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FundCommunityRestController {
	
	@GetMapping(value = "fund/fund_review_vue.do",produces = "text/plain;charset=utf-8")
	public String fund_review() {
		
		return "";
	}
	
}
