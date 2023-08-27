package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;

public interface ReplyMapper {
	@Insert("INSERT INTO wadiz_review_reply (rrno,rno,id,rid,wfno,content,group_id) VALUES("
			+ "wrr_rrno_seq.nextval, #{rno},#{id},#{rid},#{wfno},#{content},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM wadiz_review_reply))")
	public void reviewReplyInsert(ReplyVO vo);
	
	@Select("SELECT rrno, rno, id, rid, content, TO_CHAR(regdate,'MM-DD'),regdate, group_tab "
			+ "FROM wadiz_review_reply "
			+ "WHERE wfno=#{wfno} AND rno=#{rno} "
			+ "ORDER BY group_id DESC, group_step ASC")
	public List<ReplyVO> replyListData(Map map);
	
	@Update("UPDATE wadiz_review_reply SET "
			+ "content=#{content} "
			+ "WHERE rrno=#{rrno}")
	public void replyUpdate(Map map);
}
