package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.AdminDAO;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.StoreVO;

@Service
public class AdminServiceimpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<CrowdStoreVO> crowdStoreListData(Map map) {
		return dao.crowdStoreListData(map);
	}

	@Override
	public List<CrowdFundVO> crowdFundListData(Map map) {
		return dao.crowdFundListData(map);
	}
	
	@Override
	public int storeTotalPage() {
		return dao.storeTotalPage();
	}

	@Override
	public int fundTotalPage() {
		return dao.fundTotalPage();
	}
	
	@Override
	public List<MemberVO> memberListData(Map map){
		return dao.memberListData(map);
	}
	
	@Override
	public int supTotalPage() {
		return dao.supTotalPage();
	}
	
	@Override
	public List<NoticeVO> noticeListData(Map map){
		return dao.noticeListData(map);
	}
	@Override
	public int noticeTotalPage() {
		return dao.noticeTotalPage();
	}
	@Override
	public int qnaTotalPage() {
		return dao.qnaTotalPage();
	}
	@Override
	public List<AdminqnaVO> qnaListData(Map map){
		return dao.qnaListData(map);
	}
	@Override
	public MemberVO supDetailData(String id) {
		return dao.supDetailData(id);
	} 
	@Override
	public void supUpdate(MemberVO vo) {
		dao.supUpdate(vo);
	}
	@Override
	public NoticeVO noticeDetailData(int wnno) {
		return dao.noticeDetailData(wnno);
	}
	
	@Override
	public int boardTotalPage() {
		return dao.boardTotalPage();
	}
	
	@Override
	public void noticeUpdate(NoticeVO vo) {
		dao.noticeUpdate(vo);
	}
	
	@Override
	public List<MemberVO> makerListData(Map map){
		return dao.makerListData(map);
	}
	
	@Override
	public int makerTotalPage() {
		return dao.makerTotalPage();
	}
	
	@Override
	public List<FundVO> partiChart(){
		return dao.partiChart();
	}
	@Override
	public List<FundVO> catecount(){
		return dao.catecount();
	}
	@Override
	public List<StoreVO> spartiChart(){
		return dao.spartiChart();
	}
	
	@Override
	public List<StoreVO> scatecount(){
		return dao.scatecount();
	}
	
}
