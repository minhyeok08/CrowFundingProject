package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.NoticeVO;

public interface NoticeService {
	public void noticeInsert(NoticeVO vo);
	
	public List<NoticeVO> noticeListData(Map map);
	
	public int boardTotalPage();
	
	public NoticeVO noticeDetailData(int wnno);
	
	public List<NoticeVO> noticeAllListData(Map map);
}
