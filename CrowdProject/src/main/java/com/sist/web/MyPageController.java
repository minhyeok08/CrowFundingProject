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
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("json", json);
		return "mypage/my_info_update";
	}
}
