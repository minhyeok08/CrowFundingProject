package com.sist.service;

import java.util.List;
import com.sist.vo.*;

public interface MainService {
	public List<StoreVO> crowdStoreListData();
	
	public List<FundVO> crowdFundListData();
	
	public String crowdTasteFcname(String id);
	
	public List<FundVO> crowdTasteFundListData(String fcname);
}
