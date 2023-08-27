package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;

import com.sist.vo.*;

public interface QnAMapper {
	@Insert("INSERT INTO wadiz_qna (qno,wfno,id,subject,content,group_id) "
			+ "VALUES(wq_qno_seq.nextval,#{wfno},#{id},#{subject},#{content},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM wadiz_qna))")
	public void qnaInsert(Map map);
}
