package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CuponMapper;
import com.sist.vo.CuponVO;

@Repository
public class CuponDAO {
	@Autowired
	private CuponMapper mapper;
	
	public List<CuponVO> cuponListData(){
		return mapper.cuponListData();
	}
	
	public void cuponInsert(CuponVO vo) {
		mapper.cuponInsert(vo);
	}
	
	public int myCuponCount(String id) {
		return mapper.myCuponCount(id);
	}
		
	public int cuponValidate(CuponVO vo){
		return mapper.cuponValidate(vo);
	}
	
	public List<CuponVO> myCuponListData(String id){
		return mapper.myCuponListData(id);
	}
}
