package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.MemberDAO;
import com.sist.service.MemberServiceImpl;
import com.sist.service.SendMailService;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private SendMailService mailservice;
	
	@GetMapping("member/idCheck.do")
	public String member_idCheck(String id) {
		String result="";
		int count=service.memberIdCheck(id);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@GetMapping(value="member/emailCheck.do",produces="text/plain;charset=utf-8")
	public String member_emailCheck(String email) {
		String result="no";
		int count=service.memberEmailCheck(email);
		if(count==0) {
			result="yes";
		}
		return result;
	}
	
	@GetMapping("member/phoneCheck.do")
	public String member_phoneCheck(String phone) {
		String result="";
		int count=service.memberPhoneCheck(phone);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@PostMapping(value="member/join.do",produces="text/plain;charset=UTF-8")
	public String member_join_ok(MemberVO vo) {
		String result="";
		try {
			String pwd=encoder.encode(vo.getPwd());
			vo.setPwd(pwd);
			
			service.memberJoin(vo);
			
			String authKey=mailservice.sendAuthMail(vo.getEmail());
			// sendAuthMail => 메일 전송 및 authKey 생성 => return authKey
			vo.setAuthKey(authKey);
			
			Map map=new HashMap();
			map.put("email", vo.getEmail());
			map.put("authkey", vo.getAuthKey());
			//System.out.println(map);
			
			// DB에 AuthKey 업데이트(db에 저장된 email이 같은 경우 authKey 저장)
			service.authKeyUpdate(map);
			
			result="yes";
		} catch (Exception e) {
			e.printStackTrace();
			result="no";
		}
		return result;
	}
	
	
	@PostMapping(value="member/login_ok.do", produces="text/plain;charset=utf-8")
	public String member_login_ok(String id, String pwd, HttpSession session) {
		String json="";
		try {
			int count=service.memberIdCheck(id);
			MemberVO vo=service.memberLogin(id);
			// IdCheck에서 id가 없을 경우
			if(count==0) {
				vo.setMsg("noid");
			}else { // id가 있다면, 
				if(encoder.matches(pwd, vo.getPwd())) {
	                if (vo.getAuthStatus()==0) {
	                    vo.setMsg("emailNotVerified"); // 이메일 인증 필요
	                } else {
	                    vo.setMsg("ok");
	                    session.setAttribute("id", id);
	                    session.setAttribute("name", vo.getName());
	                    session.setAttribute("sex", vo.getSex());
	                    session.setAttribute("admin", vo.getAdmin());
	                }
				} else {
					vo.setMsg("nopwd");
				}
			}
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	

}
