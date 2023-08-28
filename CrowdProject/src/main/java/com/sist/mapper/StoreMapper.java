package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface StoreMapper {
	public List<StoreVO> storeListData(Map map);
	@Select("SELECT * from wadiz_store_detail WHERE wsno=#{wsno}")
	public StoreVO storeDetailData(int wsno);
	@Select("SELECT * from wadiz_store_reward WHERE wsno=#{wsno}")
	public List<StoreRewardVO> storeRewardList(int wsno);
}
