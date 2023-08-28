package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.AdminqnaVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.StoreVO;

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
	
	@Select("SELECT wnno, subject,content,category,TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, writer, state, num "
			+ "FROM (SELECT wnno, subject,content,category,regdate, hit, writer, state, rownum as num "
			+ "FROM (SELECT wnno, subject,content,category,regdate, hit, writer, state "
			+ "FROM wadiz_notice ORDER BY wnno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_admin_qna")
	public int qnaTotalPage();

	@Select("SELECT waqno, subject,id,content,isreply,group_id,group_step,group_tab,TO_CHAR(regdate,'yyyy-mm-dd') as dbday, filename,filesize,filecount, num "
			+ "FROM (SELECT waqno, subject,id,content,isreply,group_id,group_step,group_tab,regdate, filename,filesize,filecount, rownum as num  "
			+ "FROM (SELECT waqno, subject,id,content,isreply,group_id,group_step,group_tab,regdate, filename,filesize,filecount "
			+ "FROM wadiz_admin_qna ORDER BY waqno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<AdminqnaVO> qnaListData(Map map);
	
	@Select("SELECT no,id,name,nickname,birthday,sex,email,post,addr1,addr2,phone,content, "
			+ "TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss'),point,admin FROM wadiz_member "
			+ "WHERE id=#{id}")
	public MemberVO supDetailData(String id);
	
	public void supUpdate(MemberVO vo);
	
	@Select("SELECT no, name,id, email, phone, sex, birthday, addr1, addr2, post, admin, point, TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday, num "
			+ "FROM (SELECT no,name, id, email, phone, sex, birthday, addr1, addr2, post, admin, point, regdate, rownum as num "
			+ "FROM (SELECT no,name, id, email, phone, sex, birthday, addr1, addr2, post, admin, point, regdate "
			+ "FROM wadiz_member WHERE id IN(SELECT DISTINCT id FROM wadiz_fund_detail ) ORDER BY no DESC )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MemberVO> makerListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM fundmaking")
	public int makerTotalPage();
	
	@Select("SELECT wnno, subject, content, category, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, writer, state FROM wadiz_notice WHERE wnno=#{wnno}")
	public NoticeVO noticeDetailData(int wnno);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_notice")
	public int boardTotalPage();
	
	@Update("UPDATE wadiz_notice SET subject=#{subject},content=#{content},writer=#{writer},state=#{state},category=#{category} "
			+ "WHERE wnno=#{wnno}")
	public void noticeUpdate(NoticeVO vo); 
	
	@Select("SELECT ftitle,parti_count,cum_amount,achieve_rate, rownum "
			+ "FROM (SELECT ftitle,parti_count,cum_amount,achieve_rate FROM wadiz_fund_detail ORDER BY parti_count DESC) "
			+ "WHERE rownum<=10")
	public List<FundVO> partiChart();
	
	@Select("SELECT count(*) as support,fcname FROM wadiz_fund_detail GROUP BY fcno,fcname")
	public List<FundVO> catecount();
	
	@Select("SELECT goods_title, parti_count, rownum "
			+ "FROM (SELECT goods_title, parti_count FROM wadiz_store_detail ORDER BY parti_count DESC) "
			+ "WHERE rownum<=10")
	public List<StoreVO> spartiChart();
	
	@Select("SELECT count(*) as price,scname FROM wadiz_store_detail GROUP BY scno,scname")
	public List<StoreVO> scatecount();
}
