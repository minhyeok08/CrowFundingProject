package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
}
