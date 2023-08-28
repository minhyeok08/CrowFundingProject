package com.sist.web;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class FundNewsController {
	@Autowired
	private FundDAO dao;
	
	@GetMapping("fund/fund_news.do")
	public String fund_news(int wfno,Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		model.addAttribute("wfno",wfno);
		return "fund/fund_detail_news";
	}
	
	@GetMapping("fund/fund_detail_news_detail.do")
	public String fund_news(int no,int wfno,Model model) {
		
		NewsVO vo = dao.NewsDetail(no);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strRegdate = sdf.format(vo.getRegdate());
		vo.setStrRegdate(strRegdate);
        
		model.addAttribute("vo",vo);
		model.addAttribute("wfno",wfno);
		
        
		
		return "fund/fund_detail_news_detail";
	}
	
	
}
