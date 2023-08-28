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
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.StoreVO;

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
	
	public NoticeVO noticeDetailData(int wnno) {
		return mapper.noticeDetailData(wnno);
	}
	
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	public void noticeUpdate(NoticeVO vo) {
		mapper.noticeUpdate(vo);
	}
	
	public List<MemberVO> makerListData(Map map){
		return mapper.makerListData(map);
	}
	
	public int makerTotalPage() {
		return mapper.makerTotalPage();
	}
	
	public List<FundVO> partiChart(){
		return mapper.partiChart();
	}
	
	public List<FundVO> catecount(){
		return mapper.catecount();
	}
	
	public List<StoreVO> spartiChart(){
		return mapper.spartiChart();
	}
	
	public List<StoreVO> scatecount(){
		return mapper.scatecount();
	}
	
	public void qnaInsert(Map map) {
		mapper.qnaInsert(map);
	}
	
	public List<AdminqnaVO> qnaDetailData(String id){
		return mapper.qnaDetailData(id);
	}
	
}
