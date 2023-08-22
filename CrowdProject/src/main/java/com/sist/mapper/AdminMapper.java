package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;

public interface AdminMapper {
	public List<CrowdStoreVO> crowdStoreListData(Map map);
	
	public List<CrowdFundVO> crowdFundListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_store_detail")
	public int storeTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_fund_detail")
	public int fundTotalPage();
	
	@Select("SELECT no, name,id, email, phone, sex, birthday, addr1, addr2, post, admin, point, TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday, num "
			+ "FROM (SELECT no,name, id, email, phone, sex, birthday, addr1, addr2, post, admin, point, regdate, rownum as num "
			+ "FROM (SELECT no,name, id, email, phone, sex, birthday, addr1, addr2, post, admin, point, regdate "
			+ "FROM wadiz_member ORDER BY no DESC )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MemberVO> memberListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_member")
	public int supTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_notice")
	public int noticeTotalPage();
	
	@Select("SELECT wnno, subject,content,category,TO_CHAR(regdate,'yyyy-mm-dd') as dbday, hit, writer, state, num "
			+ "FROM (SELECT wnno, subject,content,category,regdate, hit, writer, state, rownum as num "
			+ "FROM (SELECT wnno, subject,content,category,regdate, hit, writer, state "
			+ "FROM wadiz_notice ORDER BY wnno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
}
