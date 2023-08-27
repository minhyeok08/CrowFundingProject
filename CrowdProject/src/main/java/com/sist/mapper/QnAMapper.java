package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface QnAMapper {
	@Insert("INSERT INTO wadiz_qna (qno,wfno,id,subject,content,group_id) "
			+ "VALUES(wq_qno_seq.nextval,#{wfno},#{id},#{subject},#{content},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM wadiz_qna))")
	public void qnaInsert(Map map);
	/*
	    QNO        NOT NULL NUMBER         
		WFNO                NUMBER         
		ID                  VARCHAR2(51)   
		SUBJECT    NOT NULL VARCHAR2(1000) 
		CONTENT    NOT NULL CLOB           
		REGDATE             DATE           
		GROUP_STEP          NUMBER         
		GROUP_ID            NUMBER         
		GROUP_TAB           NUMBER         
		ISREPLY             NUMBER 
	 */
//	<select id="qnaListForMaker" resultType="QnAVO" parameterType="hashmap">
	public List<QnAVO> qnaListForMaker(Map map);

	public int qnaListTotalpageForMaker(Map map);
	
	@Select("SELECT qno,wfno,id,subject,content,TO_CHAR(regdate,'yyyy-MM-dd') as dbday,group_id FROM wadiz_qna WHERE qno=#{qno}")
	public QnAVO qnadetailForMaker(int qno);
	// 메이커 문의 답변
	@Select("SELECT group_id FROM wadiz_qna WHERE qno=#{qno}")
	public int group_idForMakerInsert(int qno);
	@Insert("INSERT INTO wadiz_qna (qno,wfno,id,subject,content,group_id,group_step,group_tab) "
			+ "VALUES(wq_qno_seq.nextval,#{wfno},#{id},#{subject},#{content},#{group_id},1,1)")
	public void makerAnswerInsert(QnAVO vo);
	@Update("UPDATE wadiz_qna SET isreply=1 WHERE qno=#{qno}")
	public void replyOK(int qno);
	
	
	// QnA상세 출력
	// 질문
	@Select("SELECT qno,id,subject,content,TO_CHAR(regdate,'yyyy-MM-dd') as dbday,group_id FROM wadiz_qna WHERE group_id=#{group_id} AND group_step=0")
	public QnAVO question_detail(int group_id);
	@Select("SELECT qno,subject,content,TO_CHAR(regdate,'yyyy-MM-dd') as dbday,group_id FROM wadiz_qna WHERE group_id=#{group_id} AND group_step=1")
	public QnAVO answer_detail(int group_id);
	@Delete("DELETE FROM wadiz_qna WHERE qno=#{qno}")
	public void qnaDelete(int qno);
	@Delete("DELETE FROM wadiz_qna WHERE group_id=#{group_id}")
	public void qnaDeleteAll(int group_id);
	@Update("UPDATE wadiz_qna SET subject=#{subject},content=#{content} WHERE qno=#{qno}")
	public void replyUpdate(Map map);
	
}
