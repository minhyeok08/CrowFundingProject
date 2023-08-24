package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.AdminService;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.PageVO;

@RestController
public class AdminRestController {
	@Autowired
	private AdminService service;
	
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
	
	@GetMapping(value = "admin/notice_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_detail_vue(int wnno) throws Exception {
		NoticeVO vo=service.noticeDetailData(wnno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
}
