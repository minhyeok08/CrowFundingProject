package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ReviewVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void noticeInsert(NoticeVO vo) {
		dao.noticeInsert(vo);
	}

	@Override
	public List<NoticeVO> noticeListData(Map map) {
		return dao.noticeListData(map);
	}

	@Override
	public int boardTotalPage() {
		return dao.boardTotalPage();
	}

	@Override
	public NoticeVO noticeDetailData(int wnno) {
		return dao.noticeDetailData(wnno);
	}
	
	@Override
	public List<NoticeVO> noticeAllListData(Map map){
		return dao.noticeAllListData(map);
	}
	
	@Override
	public void hitIncrement(int wnno) {
		dao.hitIncrement(wnno);
	}
	
	// review 임시
	@Override
	public void reviewInsert(ReviewVO vo) {
		dao.reviewInsert(vo);
	}
	@Override
	public ReviewVO imgInsertvo() {
		return dao.imgInsertvo();
	}
	@Override
	public void reviewImgInsert(ReviewVO vo) {
		dao.reviewImgInsert(vo);
	}
	@Override
	public List<ReviewVO> reviewListData(int wfno){
		return dao.reviewListData(wfno);
	}

}
