package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MakerpageController {
	@GetMapping("makerpage/makerpage_home.do")
	public String maker_main()
	{
		return "makerpage/makerpage_home";
	}
	@GetMapping("makerpage/makerpage_news.do")
	public String maker_news()
	{
		return "makerpage/makerpage_news";
	}
}
