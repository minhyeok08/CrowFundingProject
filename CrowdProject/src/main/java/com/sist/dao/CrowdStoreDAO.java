package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class CrowdStoreDAO {
	@Autowired
	private CrowdStoreMapper mapper;
	
	public List<CrowdStoreVO> crowdStoreListData(Map map) {
		return mapper.crowdStoreListData(map);
	}
	public int crowdStoreTotalPage() {
		return mapper.crowdStoreTotalPage();
	}
	
}
