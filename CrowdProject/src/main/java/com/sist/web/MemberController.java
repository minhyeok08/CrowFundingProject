package com.sist.web;
import com.sist.vo.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.*;
@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@GetMapping("member/member_join.do")
	public String member_join() {
		return "member/member_join";
	}
	
	@GetMapping("member/member_login.do")
	public String member_login() {
		return "member/member_login";
	}
	
	@GetMapping("member/member_logout.do")
	public String member_logout(HttpSession session) {
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
