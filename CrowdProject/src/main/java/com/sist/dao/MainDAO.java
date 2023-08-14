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
	
	public List<CrowdStoreVO> crowdStoreListData() {
		return mapper.crowdStoreListData();
	}
	
	public List<CrowdFundVO> crowdFundListData() {
		return mapper.crowdFundListData();
	}
}
