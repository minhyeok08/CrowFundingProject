package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.WastaMapper;
import com.sist.vo.ProfileVO;
import com.sist.vo.ReviewVO;

@Repository
public class WastaDAO {
	@Autowired
	private WastaMapper mapper;
	
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
	
	public List<ReviewVO> wastaReviewListData(){
		return mapper.wastaReviewListData();
	}
	
	public List<ReviewVO> wastaFriendListData(){
		return mapper.wastaFriendListData();
	}
	public void supFollowInsert(Map map) {
		mapper.supFollowInsert(map);
	}
	
	public List<String> supCountData(String id) {
		List<String> supList=mapper.supCountData(id);
		return supList;
	}
	
	public void supFollowDelete(Map map) {
		mapper.supFollowDelete(map);
	}
	
	public ReviewVO myProfile(String id) {
		return mapper.myProfile(id);
	}
	
	public List<ReviewVO> wastaSelectListData(String sid){
		return mapper.wastaSelectListData(sid);
	}
	
	public ReviewVO myProfile1(String id) {
		return mapper.myProfile1(id);
	}
	
}
