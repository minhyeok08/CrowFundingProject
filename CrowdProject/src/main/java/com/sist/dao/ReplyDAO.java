package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReplyMapper;
import com.sist.vo.ReplyVO;

@Repository
public class ReplyDAO {
	@Autowired
	private ReplyMapper mapper;
	
	public void reviewReplyInsert(ReplyVO vo) {
		mapper.reviewReplyInsert(vo);
	}
	
	public List<ReplyVO> replyListData(Map map){
		return mapper.replyListData(map);
	}
	
	public void replyDelete(int rrno) {
		mapper.replyDelete(rrno);
	}
	
	public void replyUpdate(Map map) {
		mapper.replyUpdate(map);
	}
	
}
