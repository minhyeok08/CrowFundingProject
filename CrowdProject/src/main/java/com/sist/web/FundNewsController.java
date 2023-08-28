package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.*;

@Controller
public class FundNewsController {

	@Autowired
	private MainService service;
	
	@GetMapping("fund/fund_news.do")
	public String fund_news(@RequestParam int wfno,Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		model.addAttribute("wfno",wfno);
		return "fund/fund_detail_news";
	}
	
	@GetMapping("fund/fund_news_detail.do")
	public String fund_news_detail(@RequestParam int wfno, @RequestParam int no, Model model) {
		model.addAttribute("wfno", wfno);
		model.addAttribute("no", no);
		return "fund/fund_detail_news_data";
	}
}
