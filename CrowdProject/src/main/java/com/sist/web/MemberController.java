package com.sist.web;
import com.sist.vo.*;

import java.util.HashMap;
import java.util.Map;

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
	
	@GetMapping("/member/join_temp.do")
	public String member_join_temp() {
		return "member/join_temp";
	}
	
	// 인증메일에서 회원가입 하기 클릭 하면 -> 로그인 페이지로 이동
	@GetMapping("member/join_confirm.do")
	public String member_join_confirm(String email,String authKey) {
		// email과 authKey가 일치 할 경우 update
		Map map=new HashMap();
		map.put("authkey", authKey);
		map.put("email", email);
		
		dao.AuthStatusUpdate(map);
		
		return "redirect:../member/member_login.do";
	}
}
