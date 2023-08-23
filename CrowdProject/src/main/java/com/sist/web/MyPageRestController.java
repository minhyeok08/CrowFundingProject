package com.sist.web;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MyPageServiceImpl;
import com.sist.vo.MemberVO;

@RestController
public class MyPageRestController {
	@Autowired
	private MyPageServiceImpl service;
	
	@GetMapping(value="mypage/myInfoData.do", produces="text/plain;charset=utf-8")
	public String mypage_mypoint(MemberVO vo,HttpSession session) {
		String json="";
		try {
			String id=(String)session.getAttribute("id");
			vo=service.myInfo(id);
			
			System.out.println("fileName: "+vo.getProfile_name());
			System.out.println("fileUrl: "+vo.getProfile_url());
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@PostMapping(value="mypage/profileImage_insert_ok.do", produces="text/plain;charset=utf-8")
	public String mypage_profileImage_insert(MemberVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		// 이미지 저장 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/") +"profileImage\\";
		path=path.replace("\\", File.separator);
		
		MultipartFile mfile=vo.getImage();
		
		if(mfile==null) {
			vo.setProfile_name("");
			vo.setProfile_size(0);
			vo.setProfile_url("");
		} else {
			String fileName="";
			long fileSize=0;
			fileName=mfile.getOriginalFilename();
			//fileName=new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
			
			// 이미지 저장
			File file=new File(path+fileName);
			try {
				mfile.transferTo(file);
			}catch(Exception ex) {}
			
			fileSize=file.length();
			
			// 이미지 url 생성
			String contextPath = request.getContextPath();
			String profileImageUrl = contextPath + "/profileImage/" + fileName;
			//System.out.println("url:"+profileImageUrl);
			
			String id=(String)session.getAttribute("id");
			vo.setId(id); // session에 저장된 Id값 저장
			vo.setProfile_name(fileName);
			vo.setProfile_size(file.length());
			vo.setProfile_url(profileImageUrl);
		}
		service.myImageInsert(vo);
		service.myInfoUpdate(vo);
		
//		// vo -> json으로!!
//		ObjectMapper mapper=new ObjectMapper();
//		String json=mapper.writeValueAsString(vo);
//		
//		HttpHeaders headers=new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_JSON);
//		headers.set("Content-Type", "application/json;charset=UTF-8");
//		
//	    // ResponseEntity 반환
//	    return new ResponseEntity<>(json, headers, HttpStatus.OK);
		return "ok";
	}
}
