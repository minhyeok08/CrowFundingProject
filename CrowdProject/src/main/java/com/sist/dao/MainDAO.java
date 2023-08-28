package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
	public List<StoreVO> crowdStoreListData() {
		return mapper.crowdStoreListData();
	}
	
	public List<FundVO> crowdFundListData() {
		return mapper.crowdFundListData();
	}
	
	public String crowdTasteFcname(String id) {
		return mapper.crowdTasteFcname(id);
	}
	
	public List<FundVO> crowdTasteFundListData(String fcname) {
		return mapper.crowdTasteFundListData(fcname);
	}
	
	public void fundRankUpdate(Map map) {
		mapper.fundRankUpdate(map);
	}
	
	public List<FundVO> fundRankListData() {
		return mapper.fundRankListData();
	}
	
	public List<NewsVO> fundDetailNewsListData(Map map) {
		return mapper.fundDetailNewsListData(map);
	}
	
	public int fundDetailNewsTotalPage(Map map) {
		return mapper.fundDetailNewsTotalPage(map);
	}
	
	public int fundDetailNewsAllPage(Map map) {
		return mapper.fundDetailNewsAllPage(map);
	}
}
