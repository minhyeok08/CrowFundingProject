package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.mapper.NoticeMapper;
import com.sist.vo.NoticeVO;
import com.sist.vo.ReviewVO;

@Repository
public class NoticeDAO {
	@Autowired
	private NoticeMapper mapper;
	
	public void noticeInsert(NoticeVO vo) {
		mapper.noticeInsert(vo);
	}
	//<select id="noticeListData" resultType="NoticeVO" parameterType="hashmap">
	public List<NoticeVO> noticeListData(Map map){
		return mapper.noticeListData(map);
	}
	
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	public NoticeVO noticeDetailData(int wnno) {
		return mapper.noticeDetailData(wnno);
	}
	
	public List<NoticeVO> noticeAllListData(Map map){
		return mapper.noticeAllListData(map);
	}
	
	// review 임시
	public void reviewInsert(ReviewVO vo) {
		mapper.reviewInsert(vo);
	}
	public ReviewVO imgInsertvo() {
		return mapper.imgInsertvo();
	}
	public void reviewImgInsert(ReviewVO vo) {
		mapper.reviewImgInsert(vo);
	}
	public List<ReviewVO> reviewListData(int wfno){
		return mapper.reviewListData(wfno);
	}
	
}
