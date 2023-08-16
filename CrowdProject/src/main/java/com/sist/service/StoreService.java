package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.vo.StoreVO;
@Service
public interface StoreService {
	public List<StoreVO> storeListData(Map map);
}
