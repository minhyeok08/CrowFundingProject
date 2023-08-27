package com.sist.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class QnADAO {
	@Autowired
	private QnAMapper mapper;
	
//	@Insert("INSERT INTO wadiz_qna (qno,wfno,id,subject,content,group_id "
//			+ "VALUES(wq_qno_seq.nextval,#{wfno},#{id},#{subject},#{content},"
//			+ "(SELECT NVL(MAX(group_id)+1,1) FROM wadiz_qna)")
	public void qnaInsert(Map map)
	{
		mapper.qnaInsert(map);
	}
	public List<QnAVO> qnaListForMaker(Map map)
	{
		return mapper.qnaListForMaker(map);
	}
	//<select id="qnaListTotalpageForMaker" resultType="int" parameterType="hashmap">
	public int qnaListTotalpageForMaker(Map map)
	{
		return mapper.qnaListTotalpageForMaker(map);
	}
//	@Select("SELECT qno,wfno,id,subject,content FROM wadiz_qna WHERE qno=#{qno}")
	public QnAVO qnadetailForMaker(int qno)
	{
		return mapper.qnadetailForMaker(qno);
	}
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)  // 이 어노테이션이 트랜잭션을 적용합니다.
	 public void replyOk(QnAVO vo, int qno) 
	 {
	        int groupId = mapper.group_idForMakerInsert(qno);
	        vo.setGroup_id(groupId);
	        mapper.makerAnswerInsert(vo);
	        mapper.replyOK(qno);
	 }
//	 @Select("SELECT qno,id,subject,content,TO_CHAR(regdate,'yyyy-MM-dd') as dbday FROM wadiz_qna WHERE group_id=#{group_id} AND group_step=0")
	 public QnAVO question_detail(int group_id)
	 {
		 return mapper.question_detail(group_id);
	 }
//	 @Select("SELECT qno,subject,content,TO_CHAR(regdate,'yyyy-MM-dd') as dbday FROM wadiz_qna WHERE group_id=#{group_id} AND group_step=1")
	 public QnAVO answer_detail(int group_id)
	 {
		 return mapper.answer_detail(group_id);
	 }
//	 @Delete("DELETE FROM wadiz_qna WHERE qno=#{qno}")
	public void qnaDelete(int qno)
	{
		mapper.qnaDelete(qno);
	}
//	@Delete("DELETE FROM wadiz_qna WHERE group_id=#{group_id}")
	public void qnaDeleteAll(int group_id)
	{
		mapper.qnaDeleteAll(group_id);
	}
//	@Update("UPDATE wadiz_qna SET subject=#{subject},content=#{content} WHERE group_id=#{group_id}")
	public void replyUpdate(Map map)
	{
		mapper.replyUpdate(map);
	}
}
