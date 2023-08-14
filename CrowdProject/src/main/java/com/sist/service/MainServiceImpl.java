package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO dao;

	@Override
	public List<CrowdStoreVO> crowdStoreListData() {
		return dao.crowdStoreListData();
	}

	@Override
	public List<CrowdFundVO> crowdFundListData() {
		return dao.crowdFundListData();
	}
}
