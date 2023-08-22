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
	
}
