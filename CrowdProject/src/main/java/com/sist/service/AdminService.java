package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;

public interface AdminService {
	public List<CrowdStoreVO> crowdStoreListData(Map map);
	
	public List<CrowdFundVO> crowdFundListData(Map map);
	
	public int storeTotalPage();
	
	public int fundTotalPage();
	
}
