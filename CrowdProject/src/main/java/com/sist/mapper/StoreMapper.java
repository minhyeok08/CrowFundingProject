package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface StoreMapper {
	public List<StoreVO> storeListData(Map map);
	@Select("SELECT * from wadiz_store_detail WHERE wsno=#{wsno}")
	public StoreVO storeDetailData(int wsno);
	@Select("SELECT * from wadiz_store_reward WHERE wsno=#{wsno}")
	public List<StoreRewardVO> storeRewardList(int wsno);
	
	// 찜하기
	@Insert("insert into wadiz_jjim(no,fsno,wsno,id,regdate) values(wj_no_seq.nextval,2,#{wsno},#{id},sysdate)")
	public void storeJjimInsert(Map map);
	
	// 찜 확인
	@Select("select count(*) from wadiz_jjim where wsno=#{wsno} and id=#{id}")
	public int storeJjimCount(Map map);
	
	// 찜 취소
	@Delete("delete from wadiz_jjim where wsno=#{wsno} and id=#{id}")
	public void storeJjimCancel(Map map);
}
