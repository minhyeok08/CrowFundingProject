package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreMapper;
import com.sist.vo.StoreVO;
@Repository
public class StoreDAO {
	@Autowired
	private StoreMapper mapper;
	
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
}
