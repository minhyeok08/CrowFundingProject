package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface WastaMapper {
	@Select("SELECT img_name, img_size, profile_img_path, id, pno FROM member_profiles "
			+ "WHERE id=#{id}")
	public List<ProfileVO> profileData(String id);
	
//	@Insert("INSERT INTO member_profiles(img_name, img_size, profile_img_path, id, pno) VALUES("
//			+ "#{img_name},#{img_size},#{profile_img_path},#{id},NVL(MAX(pno)+1,1)")
	@Insert("INSERT INTO member_profiles(img_name, img_size, profile_img_path, id, pno) VALUES("
            + "#{imgName}, #{imgSize}, #{profileImgPath}, #{id}, (SELECT NVL(MAX(pno)+1, 1) FROM member_profiles))")
	public void profileInsert(ProfileVO vo);
	
	@Select("SELECT  " + 
			"    wfr.rno, wfr.wfno, TO_CHAR(wfr.regdate, 'MM-DD') AS dbday, wfr.regdate, wfr.likecnt, wfr.category, wfr.id, wfr.content, " + 
			"    wmem.name, wmem.nickname, " + 
			"    wmp.PROFILE_NAME,wmp.PROFILE_SIZE,wmp.PROFILE_URL, " + 
			"    rimg.imgname, rimg.imgsize, rimg.imgpath, " + 
			"    wfd.mainimg, wfd.fcname, wfd.tag, wfd.ftitle, wfd.fsubtitle, wfd.parti_count, wfd.makername, wfd.makerphoto,wfd.acno " + 
			"FROM ( " + 
			"    SELECT  " + 
			"        wfr.*,  " + 
			"        ROW_NUMBER() OVER (PARTITION BY wfr.id ORDER BY dbms_random.value) AS rn " + 
			"    FROM wadiz_fund_review wfr " + 
			") wfr " + 
			"LEFT JOIN WADIZ_REVIEW_IMG rimg ON wfr.rno = rimg.rno " + 
			"LEFT JOIN wadiz_member wmem ON wfr.id = wmem.id " + 
			"LEFT JOIN wadiz_fund_detail wfd ON wfr.wfno = wfd.wfno " + 
			"LEFT JOIN wadiz_member_profile wmp ON wfr.id = wmp.id " + 
			"WHERE wfr.rn <= 3 " + 
			"ORDER BY wfr.regdate DESC, wfr.rn, wfr.id")
	public List<ReviewVO> wastaReviewListData();
	
	@Select("SELECT rno, id, wfno, content, TO_CHAR(regdate,'MM-DD') as dbday, regdate, likecnt, category, " + 
			"       name, nickname, NO, profile_name, profile_url " + 
			"FROM ( " + 
			"    SELECT wfr.*, " + 
			"           wm.name, wm.nickname, wm.no AS NO, " + 
			"           wmp.profile_name, wmp.profile_url, " + 
			"           ROW_NUMBER() OVER (PARTITION BY wfr.id ORDER BY dbms_random.value) AS rn " + 
			"    FROM wadiz_fund_review wfr " + 
			"    JOIN wadiz_member wm ON wfr.id = wm.id " + 
			"    LEFT JOIN wadiz_member_profile wmp ON wfr.id = wmp.id " + 
			") " + 
			"WHERE rn = 1 " + 
			"ORDER BY dbms_random.value " + 
			"FETCH FIRST 8 ROWS ONLY")
	public List<ReviewVO> wastaFriendListData();
	
	@Insert("INSERT INTO wadiz_sup_follow VALUES("
			+ "wsfo_sfno_seq.nextval,#{id},#{followId})")
	public void supFollowInsert(String id, String followId);
	
}
