package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.NoticeVO;
import com.sist.vo.ReviewVO;

public interface NoticeService {
	public void noticeInsert(NoticeVO vo);
	
	public List<NoticeVO> noticeListData(Map map);
	
	public int boardTotalPage();
	
	public NoticeVO noticeDetailData(int wnno);
	
	public List<NoticeVO> noticeAllListData(Map map);
	
	public void hitIncrement(int wnno);
	
	// review 임시
	public void reviewInsert(ReviewVO vo);
	public ReviewVO imgInsertvo();
	public void reviewImgInsert(ReviewVO vo);
	public List<ReviewVO> reviewListData(int wfno);
	
}
