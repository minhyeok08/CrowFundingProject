package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.service.AdminService;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("admin/main.do")
	public String admin_main() {
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
	public String admin_chart() {
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
}
