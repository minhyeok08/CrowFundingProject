package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class FundServiceImpl implements FundService {
	@Autowired
	private FundDAO dao;

	@Override
	public List<FundVO> fundListData(Map map) {
		return dao.fundListData(map);
	}
	
}
