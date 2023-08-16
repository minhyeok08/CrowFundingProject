package com.sist.service;
import java.util.*;

import org.springframework.stereotype.Service;

import com.sist.vo.FundVO;
@Service
public interface FundListService {
	public List<FundVO> fundListData(Map map);
}
