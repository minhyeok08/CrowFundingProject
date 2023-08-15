package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("member/idCheck.do")
	public String member_idCheck(String id) {
		String result="";
		int count=dao.memberIdCheck(id);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@GetMapping("member/emailCheck.do")
	public String member_emailCheck(String email) {
		String result="";
		int count=dao.memberEmailCheck(email);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@GetMapping("member/phoneCheck.do")
	public String member_phoneCheck(String phone) {
		String result="";
		int count=dao.memberPhoneCheck(phone);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@PostMapping(value="member/join_ok.do",produces="text/plain;charset=UTF-8")
	public String member_join_ok(MemberVO vo) {
		String result="";
		try {
			String pwd=encoder.encode(vo.getPwd());
			vo.setPwd(pwd);
			dao.memberJoin(vo);
			result="yes";
		} catch (Exception e) {
			e.printStackTrace();
			result="no";
		}
		return result;
	}
	
	@PostMapping(value="member/login_ok.do", produces="text/plain;charset=utf-8")
	public String member_login_ok(String id, String pwd, HttpSession session) {
		String result="";
		try {
			int count=dao.memberIdCheck(id);
			if(count==0) {
				result="noid";
			}else {
				MemberVO vo=dao.memberLogin(id);
				if(encoder.matches(pwd, vo.getPwd())) {
					result="ok";
					session.setAttribute("id", id);
					session.setAttribute("name", vo.getName());
					session.setAttribute("sex", vo.getSex());
					session.setAttribute("admin", vo.getAdmin());
				} else {
					result="nopwd";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
