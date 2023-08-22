package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.FundVO;
import com.sist.vo.StoreVO;

public interface SearchService {
	public List<StoreVO> searchStoreListData(Map map);
	
	public List<FundVO> searchFundListData(Map map);
}
