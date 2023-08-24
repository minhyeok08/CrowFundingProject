package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
public interface MainMapper {
	public List<StoreVO> crowdStoreListData();
	
	public List<FundVO> crowdFundListData();
	
	public String crowdTasteFcname(String id);
	
	public List<FundVO> crowdTasteFundListData(String fcname);
	
	public void fundRankUpdate(Map map);
	
	public List<FundVO> fundRankListData();
}
