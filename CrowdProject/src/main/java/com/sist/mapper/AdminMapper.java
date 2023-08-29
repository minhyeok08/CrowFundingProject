package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.AdminTotalVO;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.BuyVO;
import com.sist.vo.CrowdFundVO;
import com.sist.vo.CrowdStoreVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ReviewVO;
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
	
	@Select("SELECT CEIL(COUNT(DISTINCT id)/10.0) FROM wadiz_admin_qna")
	public int qnaTotalPage();

	@Select("SELECT waqno, id, content, group_id, dbday, regdate, num  " + 
			"FROM ( " + 
			"    SELECT waqno, id,content,group_id, " + 
			"           TO_CHAR(regdate,'yyyy-mm-dd') as dbday, " + 
			"           regdate, " + 
			"           ROW_NUMBER() OVER (PARTITION BY id ORDER BY waqno DESC) as row_number, " + 
			"           rownum as num   " + 
			"    FROM ( " + 
			"        SELECT waqno,id,content,group_id, " + 
			"               TO_CHAR(regdate,'yyyy-mm-dd') as dbday, " + 
			"               regdate " + 
			"        FROM wadiz_admin_qna WHERE admin='n' ORDER BY waqno DESC) " + 
			"    )  " + 
			"WHERE num BETWEEN #{start} AND #{end} AND row_number = 1")
	public List<AdminqnaVO> qnaListData(Map map);
	
	@Insert("INSERT INTO wadiz_admin_qna(waqno,id,content,regdate,admin) VALUES("
			+ "waq_waqno_seq.nextval,#{id},#{content},SYSDATE,'y')")
	public void qnaInsert(Map map);

	@Select("SELECT * from wadiz_admin_qna WHERE id=#{id} ORDER BY waqno ASC")
	public List<AdminqnaVO> qnaDetailData(String id);
	
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
	
	@Select("SELECT memo FROM wadiz_memo")
	public String memo();
	
	@Update("UPDATE wadiz_memo SET memo=#{memo} WHERE rownum<=1")
	public void memoUpdate(String memo);
	
	@Select("SELECT  wfr.rno, wfr.wfno, TO_CHAR(wfr.regdate, 'MM-DD') AS dbday, wfr.regdate, wfr.likecnt, wfr.category, wfr.id, wfr.content,        " + 
			"			 		wmem.name, wmem.nickname,        " + 
			"			 		wmp.PROFILE_NAME,wmp.PROFILE_SIZE,wmp.PROFILE_URL,        " + 
			"			 		rimg.imgname, rimg.imgsize, rimg.imgpath,        " + 
			"			 	    wfd.mainimg, wfd.fcname, wfd.tag, wfd.ftitle, wfd.fsubtitle, wfd.parti_count, wfd.makername, wfd.makerphoto,wfd.acno        " + 
			"			 	 FROM wadiz_fund_review wfr        " + 
			"			 	 LEFT JOIN WADIZ_REVIEW_IMG rimg ON wfr.rno = rimg.rno        " + 
			"			 	 LEFT JOIN wadiz_member wmem ON wfr.id = wmem.id        " + 
			"			 	 LEFT JOIN wadiz_fund_detail wfd ON wfr.wfno = wfd.wfno        " + 
			"			 	 LEFT JOIN wadiz_member_profile wmp ON wfr.id = wmp.id       " + 
			"			 	 WHERE TRUNC(wfr.regdate) = TRUNC(SYSDATE)      " + 
			"			 	 ORDER BY wfr.regdate DESC " + 
			"			 	 FETCH FIRST 4 ROWS ONLY")
	public List<ReviewVO> todayReviewList();
	
	@Select("SELECT  " + 
			"  dates.reg_date, " + 
			"  (SELECT count(*) FROM wadiz_buy_info WHERE TRUNC(regdate) = dates.reg_date) AS buy_info_count, " + 
			"  (SELECT count(*) FROM wadiz_member WHERE TRUNC(regdate) = dates.reg_date) AS member_count, " + 
			"  (SELECT count(DISTINCT id) FROM wadiz_admin_qna WHERE TRUNC(regdate) = dates.reg_date) AS admin_qna_count, " + 
			"  (SELECT count(*) FROM wadiz_fund_review WHERE TRUNC(regdate) = dates.reg_date) AS fund_review_count, " + 
			"  (SELECT count(*) FROM wadiz_fund_detail WHERE TRUNC(regdate) = dates.reg_date) AS fund_count " + 
			"FROM  " + 
			"( " + 
			"    SELECT TRUNC(sysdate - LEVEL + 1) as reg_date " + 
			"    FROM dual " + 
			"    CONNECT BY LEVEL <= 7 " + 
			") " + 
			"dates ORDER BY reg_date DESC")
	public List<AdminTotalVO> totalListData();
	
	@Delete("DELETE FROM wadiz_fund_detail WHERE wfno=#{wfno}")
	public void fundDelete(int wfno);
	
	@Select("SELECT * FROM (select wbi.bino,wbi.acno,wbi.wfno,wbi.wsno,wbi.rno,wbi.rname,wfd.fcname,wfd.makername,wfd.endday, " + 
			"		wbi.tprice,wbi.gcount,to_char(wbi.regdate,'yyyy-MM-dd') as myday, " + 
			"		wbi.rprice,wbi.rcont,wbi.delfee,wbi.delstart,wbi.usepoint, wfd.mainimg " + 
			"		from wadiz_buy_info wbi " + 
			"		JOIN wadiz_fund_detail wfd ON wbi.wfno=wfd.wfno " + 
			"		where wbi.id=#{id}) "
			+ "		WHERE ROWNUM <=10")
	public List<BuyVO> fundJoinList(String id);
}
