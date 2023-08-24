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
}
