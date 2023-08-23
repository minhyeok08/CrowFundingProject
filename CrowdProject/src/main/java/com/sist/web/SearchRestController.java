package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
@RestController
public class SearchRestController {
	@Autowired
	private SearchService service;
	
	@GetMapping(value = "search/search_fund_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdFundListData(String category, String keyword) throws Exception {
		if (category == null) {
			category = "";
		}
		if (keyword == null) {
			keyword = "";
		}
		Map map = new HashMap();
		map.put("category", category);
		map.put("keyword", keyword);
		List<FundVO> list = service.searchFundListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	
	@GetMapping(value = "search/search_store_vue.do", produces = "text/plain;charset=UTF-8")
	public String crowdStoreListData(String category, String keyword) throws Exception {
		if (category == null) {
			category = "";
		} else if (category.equals("홈·리빙")) {
			category = "리빙·베이비";
		} else if (category.equals("베이비·키즈")) {
			category = "리빙·베이비";
		} else if (category.equals("여행·숙박")) {
			category = "여행·스포츠";
		} else if (category.equals("레저·아웃도어")) {
			category = "여행·스포츠";
		} else if (category.equals("클래스·컨설팅")) {
			category = "취미·클래스";
		} else if (category.equals("게임·취미")) {
			category = "취미·클래스";
		}
		if (keyword == null) {
			keyword = "";
		}
		Map map = new HashMap();
		map.put("category", category);
		map.put("keyword", keyword);
		List<StoreVO> list = service.searchStoreListData(map);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}

	@GetMapping(value = "search/keyword_vue.do", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String[]> getKeywords(HttpServletRequest request) {
    	Cookie[] cookies = request.getCookies();
        String[] decodedKeywords = new String[0]; // 기본 값

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("keywords".equals(cookie.getName())) {
                    try {
                        decodedKeywords = URLDecoder.decode(cookie.getValue(), "UTF-8").split("\\|");
                    } catch (Exception e) {
                        e.printStackTrace();
                        // 디코딩 실패 시 처리할 내용
                    }
                    break;
                }
            }
        }

        return ResponseEntity.ok(decodedKeywords);
    }
}
