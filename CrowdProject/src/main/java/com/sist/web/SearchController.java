package com.sist.web;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.vo.*;
@Controller
public class SearchController {
	@GetMapping("search/search.do")
	public String search_list(String keyword, String category, Model model) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		return "search/search"; // 검색 결과를 보여줄 View 템플릿 이름
	}

}
