package com.sist.vo;
//rrno NUMBER,
//rno NUMBER,
//id varchar2(30),
//rid varchar2(30),
//wfno NUMBER,
//content varchar2(4000) CONSTRAINT wrr_cont_nn NOT NULL,
//regdate DATE DEFAULT sysdate,
//GROUP_ID NUMBER,
//GROUP_STEP NUMBER DEFAULT 0,
//GROUP_TAB NUMBER DEFAULT 0,
//ROOT NUMBER DEFAULT 0,
//DEPTH NUMBER DEFAULT 0,

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	private int rrno, rno, wfno, group_id, group_step, group_tab, root, depth;
	private String id, rid, content, dbday;
	private Date regdate;
}
