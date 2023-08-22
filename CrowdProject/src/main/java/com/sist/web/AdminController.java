package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.service.AdminService;
import com.sist.vo.MemberVO;

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
	
}
