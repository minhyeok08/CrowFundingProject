package com.sist.mapper;
import java.util.*;


import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface FundListMapper {
	public List<FundVO> fundListData(Map map);
}
