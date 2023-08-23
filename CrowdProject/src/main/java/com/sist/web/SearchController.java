package com.sist.web;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.vo.*;
@Controller
public class SearchController {
	@GetMapping("search/search_before.do")
	public String search_list_before(String keyword, String category, RedirectAttributes ra, 
			HttpServletResponse response, HttpServletRequest request) {
		try {
			String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
	        Cookie cookie = new Cookie("key_" + encodedKeyword, encodedKeyword); 
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24); 
			response.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ra.addAttribute("keyword", keyword); 
		ra.addAttribute("category", category);
		return "redirect:../search/search.do";
	}
	
	@GetMapping("search/search.do")
	public String search_list(String keyword, String category, Model model) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		return "search/search";
	}

}
