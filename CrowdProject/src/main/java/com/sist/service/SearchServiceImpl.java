package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.SearchDAO;
import com.sist.vo.FundVO;
import com.sist.vo.StoreVO;
@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDAO dao;
	public List<StoreVO> searchStoreListData(Map map) {
		return dao.searchStoreListData(map);
	}
	
	public List<FundVO> searchFundListData(Map map) {
		return dao.searchFundListData(map);
	}
}
