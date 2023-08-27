package com.sist.web;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.ReplyDAO;
import com.sist.mapper.NoticeMapper;
import com.sist.service.NoticeService;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReviewVO;

@RestController
public class FundCommunityRestController {
	@Autowired
	private NoticeService service;
	
	@Autowired ReplyDAO dao;
//	@GetMapping(value = "fund/fund_review_vue.do",produces = "text/plain;charset=utf-8")
//	public String fund_review() {
//		
//		return "";
//	}
	
	@GetMapping(value = "fund/fund_reviewGet_vue.do", produces = "text/plain;charset=UTF-8")
	public String review_get(int wfno) throws Exception {
		List<ReviewVO> list=service.reviewListData(wfno);
		LocalDateTime now = LocalDateTime.now();

	    for (ReviewVO vo : list) {
	    	LocalDateTime regdate = vo.getRegdate().toInstant()
	                .atZone(ZoneId.systemDefault())
	                .toLocalDateTime();
	        
	        Duration duration = Duration.between(regdate, now);
	        
	        String dbday;
	        
	        if (duration.toDays() > 0) {
	            dbday = duration.toDays() + "일 전";
	        } else if (duration.toHours() > 0) {
	            dbday = duration.toHours() + "시간 전";
	        } else if (duration.toMinutes() > 0) {
	            dbday = duration.toMinutes() + "분 전";
	        } else {
	            dbday = duration.getSeconds() + "초 전";
	        }
	        
	       vo.setDbday(dbday);
	   }
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "fund/review_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String replyInsert(ReplyVO vo) throws Exception {
		dao.reviewReplyInsert(vo);
		return review_get(vo.getWfno());
	}
	
	@GetMapping(value = "fund/reply_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_list(int rno,int wfno) throws Exception {
		Map map=new HashMap();
		map.put("wfno", wfno);
		map.put("rno", rno);
		List<ReplyVO> list=dao.replyListData(map);
		LocalDateTime now = LocalDateTime.now();

	    for (ReplyVO vo : list) {
	    	LocalDateTime regdate = vo.getRegdate().toInstant()
	                .atZone(ZoneId.systemDefault())
	                .toLocalDateTime();
	        
	        Duration duration = Duration.between(regdate, now);
	        
	        String dbday;
	        
	        if (duration.toDays() > 0) {
	            dbday = duration.toDays() + "일 전";
	        } else if (duration.toHours() > 0) {
	            dbday = duration.toHours() + "시간 전";
	        } else if (duration.toMinutes() > 0) {
	            dbday = duration.toMinutes() + "분 전";
	        } else {
	            dbday = duration.getSeconds() + "초 전";
	        }
	        
	       vo.setDbday(dbday);
	    }
	    ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
}
