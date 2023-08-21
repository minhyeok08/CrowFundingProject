package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

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

}
