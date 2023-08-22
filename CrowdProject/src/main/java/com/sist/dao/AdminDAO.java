package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AdminMapper;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;

@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper mapper;
	
	public List<CrowdStoreVO> crowdStoreListData(Map map) {
		return mapper.crowdStoreListData(map);
	}

	public List<CrowdFundVO> crowdFundListData(Map map) {
		return mapper.crowdFundListData(map);
	}
	
	public int storeTotalPage() {
		return mapper.storeTotalPage();
	}
	
	public int fundTotalPage() {
		return mapper.fundTotalPage();
	}
	
	public List<MemberVO> memberListData(Map map){
		return mapper.memberListData(map);
	}
	public int supTotalPage() {
		return mapper.supTotalPage();
	}
	public List<NoticeVO> noticeListData(Map map){
		return mapper.noticeListData(map);
	}
	public int noticeTotalPage() {
		return mapper.noticeTotalPage();
	}
	
	public int qnaTotalPage() {
		return mapper.qnaTotalPage();
	}

	public List<AdminqnaVO> qnaListData(Map map){
		return mapper.qnaListData(map);
	}
	
	public MemberVO supDetailData(String id) {
		return mapper.supDetailData(id);
	}
	
	public void supUpdate(MemberVO vo) {
		mapper.supUpdate(vo);
	}
}
