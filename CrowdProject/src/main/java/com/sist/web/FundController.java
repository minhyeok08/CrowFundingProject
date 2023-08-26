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
import com.sist.service.*;
import com.sist.vo.*;
@Controller
@CrossOrigin("*")
public class FundController {
	@Autowired
	private FundDAO dao;
	@Autowired
	private BuyDAO bdao;
	@Autowired 
	private FundService service;
	@Autowired
	private MyPageService mpservice;
	@Autowired
	private MainService mservice;
	
	@GetMapping("fund/fund_list.do")
	public String fund_list()
	{
		return "fund/fund_list";
	}
	@GetMapping("fund/open_list.do")
	public String open_list()
	{
		return "fund/open_list";
	}

	@GetMapping("fund/fund_buy.do")
	public String fund_buy(int wfno,int rno, int gcount, Model model,HttpSession session) {
		FundVO vo = service.fundDetailData(wfno);
		FundRewardVO rvo = service.fundBuyData(rno);
		
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mpservice.myInfo(id);

        DecimalFormat df = new DecimalFormat("###,###,###");
        int cum_amount = vo.getCum_amount();
        String str_cum_amount= df.format(cum_amount);
        vo.setStrCum(str_cum_amount);
        
        //String strgcount = request.getParameter(gcount);
		//int gcount = Integer.parseInt(strgcount);
        System.out.println(gcount);
        model.addAttribute("gcount", gcount);
        model.addAttribute("mvo", mvo);
	    model.addAttribute("wfno", wfno);
	    model.addAttribute("vo", vo);
	    model.addAttribute("rvo", rvo);

	    return "fund/fund_buy";
	}
	@GetMapping("fund/fund_detail_before.do")
    public String fund_detail_before(@RequestParam int wfno,HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		
		Map map = new HashMap();
		
		// 조회수
		service.fundhitIncrement(wfno);
		
		// 랭킹 갱신용 (조회시 스코어 1증가)
		map.put("wfno", wfno);
		map.put("score", 1);
		mservice.fundRankUpdate(map);
		
		// 취향 분석 데이터 갱신용
		if (id != null) {
			FundVO vo = service.fundDetailData(wfno);
			Map ftmap = new HashMap();
			ftmap.put("id", id);
			ftmap.put("fcname", vo.getFcname());
			service.fundTasteInsert(ftmap);
		}

	    model.addAttribute("wfno", wfno);
        
        // 나머지 로직 처리
        return "redirect:../fund/fund_detail.do";
    }
	/*
	@GetMapping("fund/open_detail_before.do")
    public String open_detail_before(@RequestParam int wfno,HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		
		Map map = new HashMap();
		
		// 조회수
		service.fundhitIncrement(wfno);
		
		// 랭킹 갱신용 (조회시 스코어 1증가)
		map.put("wfno", wfno);
		map.put("score", 1);
		mservice.fundRankUpdate(map);
		
		// 취향 분석 데이터 갱신용
		if (id != null) {
			FundVO vo = service.fundDetailData(wfno);
			Map ftmap = new HashMap();
			ftmap.put("id", id);
			ftmap.put("fcname", vo.getFcname());
			service.fundTasteInsert(ftmap);
		}

	    model.addAttribute("wfno", wfno);
        
        // 나머지 로직 처리
        return "redirect:../fund/open_detail.do";
    }
    */
	@GetMapping("fund/fund_detail.do")
    public String fund_detail(@RequestParam int wfno, Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		FundVO vo = service.fundDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
        int cum_amount = vo.getCum_amount();
        String str_cum_amount= df.format(cum_amount);
        vo.setStrCum(str_cum_amount);
        
        model.addAttribute("id", id);
	    model.addAttribute("wfno", wfno);
	    model.addAttribute("vo", vo);
        
        // 나머지 로직 처리
        return "fund/fund_detail";
    }
	@RequestMapping("fund/fund_buy_ok.do")
	public String buy_Ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String strtprice = request.getParameter("tprice");
		int tprice = Integer.parseInt(strtprice);
		String strgcount = request.getParameter("gcount");
		int gcount = Integer.parseInt(strgcount);
		String strwfno = request.getParameter("wfno");
		int wfno = Integer.parseInt(strwfno);
		String strrno = request.getParameter("rno");
		int rno = Integer.parseInt(strrno);
		String rname = request.getParameter("rname");
		String name = request.getParameter("name");
		FundVO vo = dao.fundDetailData(wfno);
		String poster=vo.getMainimg();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		String rcont = request.getParameter("rcont");
		String strrprcie = request.getParameter("rprice");
		int rprice = Integer.parseInt(strrprcie);
		String strdelfee = request.getParameter("delfee");
		int delfee = Integer.parseInt(strdelfee);
		String delstart = request.getParameter("delstart");
		
		BuyVO bvo = new BuyVO();
		bvo.setRcont(rcont);
		bvo.setRprice(rprice);
		bvo.setDelfee(delfee);
		bvo.setDelstart(delstart);
		bvo.setUsepoint(1000);
		bvo.setWfno(wfno);
		bvo.setRno(rno);
		bvo.setName(name);
		bvo.setPoster(poster);
		bvo.setRname(rname);
		bvo.setTprice(tprice);
		bvo.setGcount(gcount);
		bvo.setId(id);
		
		
		Map map=new HashMap();
		map.put("rno", rno);
		map.put("gcount", gcount);
		bdao.fundCount(map);
		bdao.fundBuyInsert(bvo);
		
		//bdao.fundRewardCount();
		
		System.out.println(wfno);
		System.out.println(name);
		System.out.println(id);
		
		System.out.println(poster);
		System.out.println(rname);
		System.out.println(rno);
		
		return "redirect:../mypage/mypage_main.do";
	}
	
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
    
    /*
    @RequestMapping("fund/fund_count.do")
	public String fund_count(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String strtprice = request.getParameter("tprice");
		int tprice = Integer.parseInt(strtprice);
		String strgcount = request.getParameter("gcount");
		int gcount = Integer.parseInt(strgcount);
		String strwfno = request.getParameter("wfno");
		int wfno = Integer.parseInt(strwfno);
		String strrno = request.getParameter("rno");
		int rno = Integer.parseInt(strrno);
		String rname = request.getParameter("rname");
		String name = request.getParameter("name");
		FundVO vo = dao.fundDetailData(wfno);
		String poster=vo.getMainimg();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		return "redirect:../mypage/mypage_main.do";
	}
    */
}
