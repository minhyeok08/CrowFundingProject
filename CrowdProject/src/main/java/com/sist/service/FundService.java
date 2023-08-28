package com.sist.service;
import java.util.*;



import org.springframework.stereotype.Service;

import com.sist.vo.*;


public interface FundService {
	public List<FundVO> fundListData(Map map);
	
	public FundVO fundDetailData(int wfno);
	
	public List<FundRewardVO> fundRewardList(int wfno);
	
	public FundRewardVO fundBuyData(int rno);
	
	public void fundTasteInsert(Map map);
	
	public void fundhitIncrement(int wfno);
	
	
	public void buyAllUpdate(Map map);
	
}
