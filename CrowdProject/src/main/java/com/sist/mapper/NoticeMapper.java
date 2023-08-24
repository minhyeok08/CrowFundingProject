package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface NoticeMapper {
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM wadiz_notice")
	public int boardTotalPage();
	
	//<select id="noticeListData" resultType="NoticeVO" parameterType="hashmap">
	public List<NoticeVO> noticeListData(Map map);
	
	@Insert("INSERT INTO wadiz_notice(wnno,subject,content,category,writer,state) VALUES("
			+ "wn_wnno_seq.nextval,#{subject},#{content},#{category},#{writer},#{state})")
									// vo.getName() , vo.getSubject()
	public void noticeInsert(NoticeVO vo);
	
	@Select("SELECT wnno, subject, content, category, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, writer, state FROM wadiz_notice WHERE wnno=#{wnno}")
	public NoticeVO noticeDetailData(int wnno);
	
	//<select id="noticeAllListData" resultType="NoticeVO" parameterType="hashmap">
	public List<NoticeVO> noticeAllListData(Map map);
	
	// review 임시
	@Insert("INSERT INTO wadiz_fund_review VALUES("
			+ "wfre_rno_seq.nextval,#{id},#{wfno},#{content},SYSDATE,0,#{category})")
	public void reviewInsert(ReviewVO vo);
	@Select("SELECT * FROM wadiz_fund_review WHERE rownum<=1 ORDER BY rno DESC")
	public ReviewVO imgInsertvo();
	@Insert("INSERT INTO wadiz_review_img VALUES("
			+ "wri_rino_seq.nextval,#{id},#{rno},#{imgname},#{imgsize},#{imgpath})")
	public void reviewImgInsert(ReviewVO vo);

	/*
		SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=aa.wfno) as ftitle,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,
		filename,filesize,filecount 
		FROM newstable aa WHERE no=#{no}
	*/
	@Select("SELECT rno, id, wfno, content, TO_CHAR(regdate,'MM-DD') as dbday, regdate, likecnt, category," + 
			"		(SELECT name FROM wadiz_member WHERE id=wfr.id) AS name," + 
			"		(SELECT nickname FROM wadiz_member WHERE id=wfr.id) AS nickname," + 
			"		(SELECT no FROM wadiz_member WHERE id=wfr.id) AS NO," + 
			"		(SELECT profile_name FROM wadiz_member_profile WHERE id=wfr.id) AS profile_name," + 
			"		(SELECT profile_url FROM wadiz_member_profile WHERE id=wfr.id) AS profile_url " + 
			"		FROM wadiz_fund_review wfr WHERE wfno=7 ORDER BY rno DESC")
	public List<ReviewVO> reviewListData(int wfno);
	
}
