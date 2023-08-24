package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO dao;

	@Override
	public List<StoreVO> crowdStoreListData() {
		return dao.crowdStoreListData();
	}

	@Override
	public List<FundVO> crowdFundListData() {
		return dao.crowdFundListData();
	}

	@Override
	public String crowdTasteFcname(String id) {
		return dao.crowdTasteFcname(id);
	}

	@Override
	public List<FundVO> crowdTasteFundListData(String fcname) {
		return dao.crowdTasteFundListData(fcname);
	}

	@Override
	public void fundRankUpdate(Map map) {
		dao.fundRankUpdate(map);
	}

	@Override
	public List<FundVO> fundRankListData() {
		return dao.fundRankListData();
	}
}
