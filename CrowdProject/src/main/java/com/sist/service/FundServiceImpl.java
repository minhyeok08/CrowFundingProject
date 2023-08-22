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

	@Override
	public FundVO fundDetailData(int wfno) {
		return dao.fundDetailData(wfno);
	}

	@Override
	public List<FundRewardVO> fundRewardList(int wfno) {
		return dao.fundRewardList(wfno);
	}

	@Override
	public FundRewardVO fundBuyData(int rno) {
		return dao.fundBuyData(rno);
	}

	
	
}
