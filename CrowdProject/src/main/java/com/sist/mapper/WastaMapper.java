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
	
	@Select("SELECT rno, id, wfno, content, TO_CHAR(regdate,'MM-DD') as dbday, regdate, likecnt, category, " + 
			"       name, nickname, NO, profile_name, profile_url " + 
			"FROM (" + 
			"    SELECT wfr.*, " + 
			"           wm.name, wm.nickname, wm.no AS NO, " + 
			"           wmp.profile_name, wmp.profile_url, " + 
			"           ROW_NUMBER() OVER (PARTITION BY wfr.id ORDER BY wfr.rno DESC) AS rn " + 
			"    FROM wadiz_fund_review wfr" + 
			"    JOIN wadiz_member wm ON wfr.id = wm.id" + 
			"    LEFT JOIN wadiz_member_profile wmp ON wfr.id = wmp.id " + 
			")" + 
			"WHERE rn <= 3 " + 
			"ORDER BY rn, id, rno DESC")
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
	
	
}
