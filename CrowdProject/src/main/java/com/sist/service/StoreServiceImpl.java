package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDAO dao;

	@Override
	public List<StoreVO> storeListData(Map map) {
		return dao.storeListData(map);
	}
	
	
}
