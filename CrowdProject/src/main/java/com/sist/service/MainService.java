package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.*;

public interface MainService {
	public List<StoreVO> crowdStoreListData();
	
	public List<FundVO> crowdFundListData();
	
	public String crowdTasteFcname(String id);
	
	public List<FundVO> crowdTasteFundListData(String fcname);
	
	public void fundRankUpdate(Map map);
	
	public List<FundVO> fundRankListData();
}
