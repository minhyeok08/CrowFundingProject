package com.sist.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.AdminService;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.StoreVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("admin/main.do")
	public String admin_main(Model model) {
		String memo=service.memo();
		model.addAttribute("memo",memo);
		return "admin/main";
	}

	@GetMapping("admin/supporter.do")
	public String admin_supporter() {
		return "admin/supporter";
	}
	
	@GetMapping("admin/maker.do")
	public String admin_maker() {
		return "admin/maker";
	}
	
	@GetMapping("admin/fund.do")
	public String admin_fund() {
		return "admin/fund";
	}
	
	@GetMapping("admin/store.do")
	public String admin_store() {
		return "admin/store";
	}
	
	@GetMapping("admin/notice.do")
	public String admin_notice() {
		return "admin/notice";
	}
	
	@GetMapping("admin/qna.do")
	public String admin_qna() {
		return "admin/qna";
	}
	
	@GetMapping("admin/chart.do")
	public String admin_chart(Model model) {
		
		List<FundVO> clist=service.catecount();
		List<FundVO> list=service.partiChart();
		List<StoreVO> slist=service.spartiChart();
		for(StoreVO vo:slist) {
			String title=vo.getGoods_title();
			title=title.substring(0,8);
			title=title+"...";
			vo.setGoods_title(title);
		}
		List<StoreVO> sclist=service.scatecount();
		model.addAttribute("slist",slist);
		model.addAttribute("sclist",sclist);
		model.addAttribute("clist",clist);
		model.addAttribute("list",list);
		return "admin/chart";
	}
	
	@GetMapping("admin/notice_insert.do")
	public String admin_notice_insert() {
		return "admin/notice_insert";
	}
	
	
	@GetMapping("admin/sup_detail.do")
	public String admin_sup_detail(String id,Model model) {
		model.addAttribute("id",id);
		return "admin/sup_detail";
	}
	
	@GetMapping("admin/sup_update.do")
	public String admin_sup_update(String id,Model model) {
		MemberVO vo=service.supDetailData(id);
		model.addAttribute("id",id);
		model.addAttribute("vo",vo);
		return "admin/sup_update";
	}
	
	@PostMapping("admin/sup_update_ok.do")
	public String sup_update_ok(MemberVO vo) {
		service.supUpdate(vo);
		return "redirect:../admin/sup_detail.do?id="+vo.getId();
	}
	
	@GetMapping("admin/notice_detail.do")
	public String admin_notice_detail(int wnno,Model model) {
		model.addAttribute("wnno",wnno);
		return "admin/notice_detail";
	}
	
	@GetMapping("admin/notice_update.do")
	public String admin_notice_update(int wnno,Model model) {
		NoticeVO vo=service.noticeDetailData(wnno);
		model.addAttribute("wnno",wnno);
		model.addAttribute("vo",vo);
		return "admin/notice_update";
	}
	
	@PostMapping("admin/notice_update_ok.do")
	public String notice_update_ok(NoticeVO vo) {
		service.noticeUpdate(vo);
		return "redirect:../admin/notice_detail.do?wnno="+vo.getWnno();
	}
	
	@GetMapping("admin/maker_detail.do")
	public String admin_maker_detail(String id,Model model) {
		model.addAttribute("id",id);
		return "admin/maker_detail";
	}
	
	@GetMapping("admin/maker_update.do")
	public String admin_maker_update(String id,Model model) {
		MemberVO vo=service.supDetailData(id);
		model.addAttribute("id",id);
		model.addAttribute("vo",vo);
		return "admin/sup_update";
	}
	
	@PostMapping("admin/maker_update_ok.do")
	public String maker_update_ok(MemberVO vo) {
		service.supUpdate(vo);
		return "redirect:../admin/maker_detail.do?id="+vo.getId();
	}
	
	@PostMapping("admin/memo.do")
	public String admin_memo(String memo) {
		service.memoUpdate(memo);
		return "redirect:../admin/main.do";
	}
	
	@GetMapping("admin/sup_fund_join.do")
	public String sup_fund_join(String id,Model model) {
		model.addAttribute("id",id);
		return "admin/sup_fund_join";
	}
}
