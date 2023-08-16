package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundListDAO {
	@Autowired
	private FundListMapper mapper;
	
	public List<FundVO> fundListData(Map map)
	{
		return mapper.fundListData(map);
	}
}
