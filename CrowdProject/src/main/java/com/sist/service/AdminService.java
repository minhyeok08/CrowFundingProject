package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.AdminqnaVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.StoreVO;

public interface AdminService {
	public List<CrowdStoreVO> crowdStoreListData(Map map);
	
	public List<CrowdFundVO> crowdFundListData(Map map);
	
	public int storeTotalPage();
	
	public int fundTotalPage();
	
	public List<MemberVO> memberListData(Map map);
	
	public int supTotalPage();
	
	public List<NoticeVO> noticeListData(Map map);
	
	public int noticeTotalPage();
	
	public int qnaTotalPage();

	public List<AdminqnaVO> qnaListData(Map map);
	
	public MemberVO supDetailData(String id);
	
	public void supUpdate(MemberVO vo);
	
	public NoticeVO noticeDetailData(int wnno);
	
	public int boardTotalPage();
	
	public void noticeUpdate(NoticeVO vo);
	
	public List<MemberVO> makerListData(Map map);
	
	public int makerTotalPage();
	
	public List<FundVO> partiChart();
	
	public List<FundVO> catecount();
	
	public List<StoreVO> spartiChart();
	
	public List<StoreVO> scatecount();
	
	public void qnaInsert(Map map);
}
