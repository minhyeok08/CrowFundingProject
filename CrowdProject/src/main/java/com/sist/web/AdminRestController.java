package com.sist.web;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.AdminDAO;
import com.sist.service.AdminService;
import com.sist.service.FundService;
import com.sist.vo.AdminTotalVO;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.BuyVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.PageVO;
import com.sist.vo.ReviewVO;

@RestController
public class AdminRestController {
	@Autowired
	private AdminService service;
	@Autowired
	private AdminDAO dao;
	@Autowired
	private FundService fservice;
	
	@GetMapping(value = "admin/store_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String storeListData(int curpage, int scno) throws Exception {
		
		Map map=new HashMap();
		int rowSize=16;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("scno", scno);
		map.put("start", start);
		map.put("end", end);
		int totalpage=service.storeTotalPage();
		List<CrowdStoreVO> list = service.crowdStoreListData(map);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/store_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String store_page_list(int page) throws Exception {
		
		int totalpage=service.storeTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "admin/fund_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String fundListData(int curpage, int fcno) throws Exception {
		Map map=new HashMap();
		int rowSize=16;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("fcno", fcno);
		map.put("start", start);
		map.put("end", end);
		int totalpage=service.fundTotalPage();
		List<CrowdFundVO> list = service.crowdFundListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/fund_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String fund_page_list(int page) throws Exception {
		
		int totalpage=service.fundTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	
	@GetMapping(value = "admin/member_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String member_list_vue(int page) throws Exception {
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		List<MemberVO> list = service.memberListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/supporter_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String sup_page_list(int page) throws Exception {
		
		int totalpage=service.supTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "admin/maker_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String maker_list_vue(int page) throws Exception {
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		List<MemberVO> list = service.makerListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/maker_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String maker_page_list(int page) throws Exception {
		
		int totalpage=service.makerTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "admin/notice_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_list_vue(int page) throws Exception {
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> list=service.noticeListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/notice_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_page_list(int page) throws Exception {
		
		int totalpage=service.noticeTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	
	@GetMapping(value = "admin/qna_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String qna_list_vue(int page) throws Exception {
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		List<AdminqnaVO> list=service.qnaListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "admin/qna_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String qna_page_list(int page) throws Exception {
		
		int totalpage=service.qnaTotalPage();
		
		final int BLOCK=10;
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "admin/sup_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String sup_detail_vue(String id) throws Exception {
		MemberVO vo=service.supDetailData(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "admin/maker_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String maker_detail_vue(String id) throws Exception {
		MemberVO vo=service.supDetailData(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "admin/notice_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_detail_vue(int wnno) throws Exception {
		NoticeVO vo=service.noticeDetailData(wnno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "admin/qna_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String qna_insert(String id,String content) throws Exception {
		Map map=new HashMap();
		map.put("id", id);
		map.put("content", content);
		service.qnaInsert(map);
		List<AdminqnaVO> list = dao.qnaDetailData(id);
		LocalDateTime now = LocalDateTime.now();

	    for (AdminqnaVO vo : list) {
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
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "admin/qna_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String qna_detail(String id) throws Exception {
		System.out.println("넘어온 아이디값: "+id);
		List<AdminqnaVO> list = dao.qnaDetailData(id);
		LocalDateTime now = LocalDateTime.now();

	    for (AdminqnaVO vo : list) {
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
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}	
	
	@GetMapping(value = "admin/today_review_vue.do",produces = "text/plain;charset=UTF-8")
	public String today_review() throws Exception {
		List<ReviewVO> list = dao.todayReviewList();
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
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "admin/today_total_vue.do",produces = "text/plain;charset=UTF-8")
	public String today_total() throws Exception {
		List<AdminTotalVO> list = dao.totalListData();
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "admin/fund_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String fund_delete(int wfno, int fcno) throws Exception {
		service.fundDelete(wfno);
		Map map = new HashMap();
		map.put("fcno", fcno);
		List<FundVO> list = fservice.fundListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value="admin/fund_join_vue.do",produces = "text/plain;charset=utf-8")
	public String fund_list_data(String id) throws Exception {
		String json="";
		List<BuyVO> list=service.fundJoinList(id);
		Date today=new Date();
		for(BuyVO vo:list) {
			if(vo.getEndday().after(today)) {
				vo.setFundStatus("진행중");
			} else if(vo.getEndday().before(today) || vo.getEndday().equals(today)) {
				vo.setFundStatus("종료");
			}
			int totalPrice=vo.getTprice()-vo.getDelfee()-vo.getUsepoint();
			vo.setTotalPrice(totalPrice);
		}
		ObjectMapper mapper=new ObjectMapper();
		json=mapper.writeValueAsString(list);
		return json;
		
	}
}
