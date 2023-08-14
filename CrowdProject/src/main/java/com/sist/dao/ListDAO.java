package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ListMapper;
import com.sist.vo.ProfileVO;

@Repository
public class ListDAO {
	@Autowired
	private ListMapper mapper;
	
//	@Select("SELECT img_name, img_size, profile_img_path, id, pno FROM member_profiles "
//			+ "WHERE id=#{id}")
	public List<ProfileVO> profileData(String id) {
		return mapper.profileData(id);
	}
	
//	@Insert("INSERT INTO member_profiles(img_name, img_size, profile_img_path, id, pno) VALUES("
//			+ "#{img_name},#{img_size},#{profile_img_path},#{id},NVL(MAX(pno)+1,1)")
	public void profileInsert(ProfileVO vo) {
		mapper.profileInsert(vo);
	}
	
}
