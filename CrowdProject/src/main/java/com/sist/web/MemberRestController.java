package com.sist.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	 // 인증메일 발송
    @RequestMapping(value="member/sendEmail_ok.do", produces = "text/plain;charset=utf-8")
    public String sendAuthMail(String email) throws UnsupportedEncodingException, javax.mail.MessagingException {
    	// 6자리 난수 인증번호 생성
    	String authKey=mailservice.getKey(6);
    	System.out.println("authKey: "+authKey);// 생성여부 확인
    	
        JavaMailSender sender = mailservice.javaMailSender();
        MimeMessage message = sender.createMimeMessage();
        String mailContent = "<strong>[이메일 인증]</strong><br>"
        		+ "<h3>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</h3><br>"
                + "<a href='http://localhost/web/member/join_confirm.do?email=" 
                + email+ "&authKey=" + authKey +"' target='_blenk'>이메일 인증 확인</a>";
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        
	    // 보내는 사람 정보
	    String fromEmail = "hsyoung17@gmail.com";
	    String fromName = "관리자";
	    
	    // 받는 사람 정보
	    String toEmail = email;
	    
	    helper.setFrom(new InternetAddress(fromEmail, fromName));
	    helper.setTo(toEmail);
	    helper.setSubject("회원가입 인증메일");
	    helper.setText(mailContent,true);
	    
	    sender.send(message);
	    
	    return authKey;
    }
	
	@PostMapping(value="member/join.do",produces="text/plain;charset=UTF-8")
	public String member_join_ok(MemberVO vo) {
		String result="";
		try {
			String pwd=encoder.encode(vo.getPwd());
			vo.setPwd(pwd);
			
			service.memberJoin(vo);
			
			String authKey=sendAuthMail(vo.getEmail());
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
			MemberVO vo=new MemberVO();
			
			// IdCheck에서 id가 없을 경우
			if(count==0) {
				vo.setMsg("noid");
			}else { // id가 있다면, 
				vo=service.memberLogin(id);
				if(encoder.matches(pwd, vo.getPwd())) {
	                if (vo.getAuthStatus()==0) {
	                    vo.setMsg("emailNotVerified");
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
	
	@GetMapping(value="member/id_find.do", produces="text/plain;charset=utf-8")
	public String member_id_find(String email) {
		String result="";
		try {
			System.out.println("inputEmail="+email);
			int count=service.memberEmailCheck(email);
			if(count==0) {
				result="noemail";
			} else {
				result=service.memberFindID(email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
    // 비밀번호 변경 이메일 전송
    @GetMapping(value="member/pwd_send_email.do", produces="text/plain;charset=utf-8")
	public String member_pwd_send_email(String email) {
    	String result="";
		try {
			int count=service.memberEmailCheck(email);
			if(count==0) {
				result="noemail";
			} else {
				String tempPwd=mailservice.getKey(6);
				String encodedPwd=encoder.encode(tempPwd); // 비밀번호 암호화
				
				System.out.println("tempPwd:"+tempPwd);
				
				JavaMailSender sender=mailservice.javaMailSender();
				MimeMessage message=sender.createMimeMessage();
				String mailContent = "<h4>[임시 비밀번호 발급]</h4><br>"
		                + "안녕하세요 회원님<br>"
		                + "임시 비밀번호는 <strong>" + tempPwd + "</strong> 입니다.<br>"
		                + "로그인 후 마이페이지에서 비밀번호를 변경해주시길 바랍니다!";
				 MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				
				Map map=new HashMap();
				map.put("email", email);
				map.put("pwd", encodedPwd);
				
				service.pwdUpdate(map);
			    // 보내는 사람 정보
			    String fromEmail = "hsyoung17@gmail.com";
			    String fromName = "관리자";
			    
			    // 받는 사람 정보
			    String toEmail = email;
			    
			    helper.setFrom(new InternetAddress(fromEmail, fromName));
			    helper.setTo(toEmail);
			    helper.setSubject("비밀번호 변경");
			    helper.setText(mailContent,true);
			    
			    sender.send(message);
			    
			    result="ok";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
