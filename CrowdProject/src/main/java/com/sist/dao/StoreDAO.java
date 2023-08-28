package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreMapper;
import com.sist.vo.*;
@Repository
public class StoreDAO {
	@Autowired
	private StoreMapper mapper;
	
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
//	@Select("SELECT * from wadiz_store_detail WHERE wsno=#{wsno}")
	public StoreVO storeDetailData(int wsno)
	{
		return mapper.storeDetailData(wsno);
	}
//	@Select("SELECT * from wadiz_store_reward WHERE wsno=#{wsno}")
	public List<StoreRewardVO> storeRewardList(int wsno)
	{
		return mapper.storeRewardList(wsno);
	}
	
	// 찜하기
	public void storeJjimInsert(Map map) {
		mapper.storeJjimInsert(map);
	}
	
	// 찜 확인
	public int storeJjimCount(Map map) {
		return mapper.storeJjimCount(map);
	}
	
	// 찜 취소
	public void storeJjimCancel(Map map) {
		mapper.storeJjimCancel(map);
	}
}
