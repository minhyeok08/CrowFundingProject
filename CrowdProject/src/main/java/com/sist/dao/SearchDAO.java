package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SearchMapper;
import com.sist.vo.FundVO;
import com.sist.vo.StoreVO;
@Repository
public class SearchDAO {
	@Autowired
	private SearchMapper mapper;
	
	public List<StoreVO> searchStoreListData(Map map) {
		return mapper.searchStoreListData(map);
	}
	
	public List<FundVO> searchFundListData(Map map) {
		return mapper.searchFundListData(map);
	}
}
