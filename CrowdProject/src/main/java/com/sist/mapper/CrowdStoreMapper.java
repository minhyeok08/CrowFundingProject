package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface CrowdStoreMapper {
	// 목록
	@Select("SELECT wsno, main_poster, goods_title, score, maker_name, price, num "
			+ "FROM (SELECT wsno, main_poster, goods_title, score, maker_name, price, rownum as num "
			+ "FROM (SELECT wsno, main_poster, goods_title, score, maker_name, price "
			+ "FROM wadiz_store_detail ORDER BY wsno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CrowdStoreVO> crowdStoreListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM wadiz_store_detail")
	public int crowdStoreTotalPage();
	
	// 상세
	
	
	// 검색
	@Select("SELECT wsno, main_poster, goods_title, score, maker_name, price, num "
			+ "FROM (SELECT wsno, main_poster, goods_title, score, maker_name, price, rownum as num "
			+ "FROM (SELECT wsno, main_poster, goods_title, score, maker_name, price "
			+ "FROM wadiz_store_detail WHERE goods_title LIKE '%'||#{goods_title}||'%' ORDER BY wsno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CrowdStoreVO> crowdStoreFindData(Map map);
}
