package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
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
	
}
