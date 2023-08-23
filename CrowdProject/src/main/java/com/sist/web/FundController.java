package com.sist.web;
import java.text.DecimalFormat;
import java.util.*;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.*;
import com.sist.service.FundService;
import com.sist.vo.FundRewardVO;
import com.sist.vo.FundVO;
@Controller
@CrossOrigin("*")
public class FundController {
	@Autowired
	private FundDAO dao;
	@Autowired FundService service;
	@GetMapping("fund/fund_list.do")
	public String fund_list()
	{
		return "fund/fund_list";
	}
	/*@GetMapping("fund/fund_detail.do")
	public String fund_detail(int wfno,Model model)
	{
		model.addAttribute("wfno", wfno);
		return "fund/fund_detail";
	}
	/*@GetMapping("fund/fund_choice.do")
	public String fund_choice(String wfno,Model model)
	{
		int wfno2=(Integer.parseInt(wfno));
		model.addAttribute("wfno", wfno2);
		return "fund/fund_choice";
	}*/
	@GetMapping("fund/fund_buy.do")
	public String fund_buy(int wfno,int rno, Model model,HttpSession session) {
		FundVO vo = service.fundDetailData(wfno);
		FundRewardVO rvo = service.fundBuyData(rno);
		
		String id = (String) session.getAttribute("ID");
		//List<FundRewardVO> list=dao.fundRewardList(wfno);
		
		/*DecimalFormat df=new DecimalFormat("###,###,###");
		List<String> fPrices = new ArrayList<>();
	    for (FundRewardVO rvo : list) {
	        int rprice = rvo.getRprice();
	        String formattedPrice = df.format(rprice);
	        fPrices.add(formattedPrice);
	    }
	    model.addAttribute("vo", vo);
	    model.addAttribute("fPrices", fPrices);*/
        DecimalFormat df = new DecimalFormat("###,###,###");
        int cum_amount = vo.getCum_amount();
        String str_cum_amount= df.format(cum_amount);
        vo.setStrCum(str_cum_amount);
       

	    model.addAttribute("wfno", wfno);
	    model.addAttribute("vo", vo);
	    model.addAttribute("rvo", rvo);

	    return "fund/fund_buy";
	}
//	@RequestMapping("fund/fund_buy.do")
//	public String fund_buy(HttpServletRequest request,HttpServletResponse response)
//	{
//		String swfno=request.getParameter("wfno");
//		int wfno=Integer.parseInt(swfno);
//		FundDAO dao=new FundDAO();
//		FundVO vo=dao.fundDetailData(wfno);
//		request.setAttribute("vo",vo); 
//		request.setAttribute("main_jsp", "../fund/fund_buy.jsp");
//		
//		return "../main/main.jsp";
//	}
	
	@GetMapping("fund/fund_detail.do")
    public String fund_detail(@RequestParam int wfno, Model model) {
		FundVO vo = service.fundDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
        int cum_amount = vo.getCum_amount();
        String str_cum_amount= df.format(cum_amount);
        vo.setStrCum(str_cum_amount);

	    model.addAttribute("wfno", wfno);
	    model.addAttribute("vo", vo);
        
        // 나머지 로직 처리
        return "fund/fund_detail";
    }
	/*
	@RequestMapping("fund/agreeBtn1.do")
	public String agreeBtn1(HttpServletRequest request, HttpServletResponse response) {
		return "../fund/agreeBtn1.jsp";
	}
	@RequestMapping("fund/agreeBtn2.do")
	public String agreeBtn2(HttpServletRequest request, HttpServletResponse response) {
		return "../fund/agreeBtn2.jsp";
	}
	@RequestMapping("fund/agreeBtn3.do")
	public String agreeBtn3(HttpServletRequest request, HttpServletResponse response) {
		return "../fund/agreeBtn3.jsp";
	}
	*/
	@GetMapping("fund/agreeBtn1.do")
    public String agreeBtn1() {
		return "fund/agreeBtn1";
    }

    @GetMapping("fund/agreeBtn2.do")
    public String agreeBtn2() {
    	return "fund/agreeBtn2";
    }

    @GetMapping("fund/agreeBtn3.do")
    public String agreeBtn3() {
    	return "fund/agreeBtn3";
    }
}
