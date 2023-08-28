package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.CuponVO;

public interface CuponMapper {
	@Select("SELECT * FROM wadiz_cupon_info")
	public List<CuponVO> cuponListData();
	
	@Insert("INSERT INTO wadiz_my_cupon values(wmc_mcpno_seq.nextval,#{id},#{cpno})")
	public void cuponInsert(CuponVO vo);
	
	// 내 쿠폰 갯수
	@Select("select count(*) from wadiz_my_cupon where id=#{id}")
	public int myCuponCount(String id);
	
	// 내 쿠폰 정보
	@Select("SELECT title, discount " + 
			"FROM wadiz_cupon_info wci " + 
			"JOIN wadiz_my_cupon wmc ON wci.cpno = wmc.cpno " + 
			"WHERE id=#{id}")
	public List<CuponVO> myCuponListData(String id);
	
	// 쿠폰 중복 다운 방지
	@Select("select count(*) from wadiz_my_cupon where id=#{id} and cpno=#{cpno}")
	public int cuponValidate(CuponVO vo);
}
