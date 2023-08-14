package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ListMapper {
	@Select("SELECT img_name, img_size, profile_img_path, id, pno FROM member_profiles "
			+ "WHERE id=#{id}")
	public List<ProfileVO> profileData(String id);
	
//	@Insert("INSERT INTO member_profiles(img_name, img_size, profile_img_path, id, pno) VALUES("
//			+ "#{img_name},#{img_size},#{profile_img_path},#{id},NVL(MAX(pno)+1,1)")
	@Insert("INSERT INTO member_profiles(img_name, img_size, profile_img_path, id, pno) VALUES("
            + "#{imgName}, #{imgSize}, #{profileImgPath}, #{id}, (SELECT NVL(MAX(pno)+1, 1) FROM member_profiles))")
	public void profileInsert(ProfileVO vo);
}
