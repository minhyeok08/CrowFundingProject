package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MyPageServiceImpl;
import com.sist.vo.MemberVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageServiceImpl service;
	
	@GetMapping("mypage/mypage_main.do")
	public String mypagae_main() {
		return "mypage/mypage_main";
	}
	
	@GetMapping("mypage/my_info_update.do")
	public String mypage_info_update(MemberVO vo, HttpSession session,Model model) {
		String json="";
		String id=(String)session.getAttribute("id");
		vo=service.myInfo(id);
		vo.setContent(vo.getContent() == null ? "" : vo.getContent());
		vo.setNickname(vo.getNickname() == null ? "" : vo.getNickname());
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("myUrl:"+vo.getProfile_url());
		model.addAttribute("json", json);
		return "mypage/my_info_update";
	}
	
	@GetMapping("mypage/myFundDetail.do")
	public String mypage_fund_detail() {
		return "mypage/my_funding";
	}
	
	@GetMapping("mypage/my_jjim.do")
	public String mypage_jjim() {
		return "mypage/my_jjim";
	}
	
	@GetMapping("mypage/my_qna_maker.do")
	public String mypage_qna_maker() {
		return "mypage/my_qna_maker";
	}
	
	@GetMapping("mypage/my_qna_maker_reply.do")
	public String mypage_qna_maker_reply() {
		return "mypage/my_qna_maker_reply";
	}
}