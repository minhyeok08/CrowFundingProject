package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
public interface SearchMapper {
	public List<StoreVO> searchStoreListData(Map map);
	
	public List<FundVO> searchFundListData(Map map);
}
