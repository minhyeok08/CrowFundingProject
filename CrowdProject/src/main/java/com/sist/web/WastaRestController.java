package com.sist.web;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.WastaDAO;
import com.sist.vo.ReviewVO;

@RestController
public class WastaRestController {
	@Autowired
	private WastaDAO dao;
	
	@GetMapping(value = "wasta/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String wasta_list() throws Exception {
		List<ReviewVO> list=dao.wastaReviewListData();
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
	
	@GetMapping(value = "wasta/select_review_vue.do", produces = "text/plain;charset=UTF-8")
	public String select_list(String sid) throws Exception {
		List<ReviewVO> list=dao.wastaSelectListData(sid);
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
	
	@GetMapping(value = "wasta/friend_vue.do", produces = "text/plain;charset=UTF-8")
	public String friend_list() throws Exception {
		List<ReviewVO> list=dao.wastaFriendListData();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@PostMapping(value = "wasta/follow_vue.do", produces = "text/plain;charset=UTF-8")
	public String follow_insert(@RequestParam("followId") String followId, @RequestParam("id") String id) throws Exception {
		Map map=new HashMap();
		map.put("id", id);
		map.put("followId", followId);
	    dao.supFollowInsert(map);
	    List<ReviewVO> list=dao.wastaFriendListData();
	    ObjectMapper mapper=new ObjectMapper();
	    String json=mapper.writeValueAsString(list);
	    return json;
	}
	
	@PostMapping(value = "wasta/follow_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String follow_delete(@RequestParam("followId") String followId, @RequestParam("id") String id) throws Exception {
		Map map=new HashMap();
		map.put("id", id);
		map.put("followId", followId);
	    dao.supFollowDelete(map);
	    List<ReviewVO> list=dao.wastaFriendListData();
	    ObjectMapper mapper=new ObjectMapper();
	    String json=mapper.writeValueAsString(list);
	    return json;
	}
	@GetMapping(value = "wasta/getSessionId", produces = "text/plain;charset=UTF-8")
	public String getSessionId(HttpSession session) {
	    return (String)session.getAttribute("id");
	}
	
	@GetMapping(value = "wasta/sup_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String supCheck(String id) throws Exception {
		List<String> list= dao.supCountData(id);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "wasta/my_vue.do", produces = "text/plain;charset=UTF-8")
	public String my_profile(String id) throws Exception {
		ReviewVO vo=dao.myProfile(id);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
}
