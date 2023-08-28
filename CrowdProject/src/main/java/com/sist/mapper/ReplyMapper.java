package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;

public interface ReplyMapper {
	@Insert("INSERT INTO wadiz_review_reply (rrno,rno,id,rid,wfno,content,group_id) VALUES("
			+ "wrr_rrno_seq.nextval, #{rno},#{id},#{rid},#{wfno},#{content},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM wadiz_review_reply))")
	public void reviewReplyInsert(ReplyVO vo);
	
	@Select("SELECT rrno, rno, id, rid, content, TO_CHAR(regdate,'MM-DD'),regdate, group_tab,"
			+ "(SELECT name FROM wadiz_member WHERE id=wrr.id) AS name,"
			+ "(SELECT nickname FROM wadiz_member WHERE id=wrr.id) AS nickname, "
			+ "(SELECT no FROM wadiz_member WHERE id=wrr.id) AS NO,"
			+ "(SELECT profile_name FROM wadiz_member_profile WHERE id=wrr.id) AS profile_name,"
			+ "(SELECT profile_url FROM wadiz_member_profile WHERE id=wrr.id) AS profile_url "
			+ "FROM wadiz_review_reply wrr "
			+ "WHERE wfno=#{wfno} AND rno=#{rno} "
			+ "ORDER BY group_id DESC, group_step ASC")
	public List<ReplyVO> replyListData(Map map);
	
	@Delete("DELETE FROM wadiz_review_reply WHERE rrno=#{rrno}")
	public void replyDelete(int rrno);
	
	@Update("UPDATE wadiz_review_reply SET "
			+ "content=#{content} "
			+ "WHERE rrno=#{rrno}")
	public void replyUpdate(Map map);
}
