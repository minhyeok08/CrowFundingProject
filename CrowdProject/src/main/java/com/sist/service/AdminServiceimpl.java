package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.AdminDAO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;

@Service
public class AdminServiceimpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<CrowdStoreVO> crowdStoreListData(Map map) {
		return dao.crowdStoreListData(map);
	}

	@Override
	public List<CrowdFundVO> crowdFundListData(Map map) {
		return dao.crowdFundListData(map);
	}
	
	@Override
	public int storeTotalPage() {
		return dao.storeTotalPage();
	}

	@Override
	public int fundTotalPage() {
		return dao.fundTotalPage();
	}

}
