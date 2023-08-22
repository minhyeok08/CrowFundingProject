package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;

public interface AdminService {
	public List<CrowdStoreVO> crowdStoreListData(Map map);
	
	public List<CrowdFundVO> crowdFundListData(Map map);
	
	public int storeTotalPage();
	
	public int fundTotalPage();
	
	public List<MemberVO> memberListData(Map map);
	
	public int supTotalPage();
	
	public List<NoticeVO> noticeListData(Map map);
	
	public int noticeTotalPage();
}
