package com.sist.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.URLDecoder;
import java.util.*;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class KeywordIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        List<String> decodedKeywords = new ArrayList<String>();
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("key_")) {
	                String decodedValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                decodedKeywords.add(decodedValue);
	            }
	        }
	        
	        if (!decodedKeywords.isEmpty()) {
	            String[] decodedKeywordsArray = decodedKeywords.toArray(new String[0]);
	            Cookie keywordsCookie = new Cookie("keywords", String.join("|", decodedKeywordsArray));
	            keywordsCookie.setPath("/");
	            response.addCookie(keywordsCookie);
	        }
	    }
	    return super.preHandle(request, response, handler);
	}
	
}
