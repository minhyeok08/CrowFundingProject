package com.sist.web;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MemberServiceImpl;
import com.sist.service.MyPageServiceImpl;
import com.sist.vo.MemberVO;

@RestController
public class MyPageRestController {
	@Autowired
	private MyPageServiceImpl service;
	@Autowired
	private MemberServiceImpl mservice;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping(value="mypage/myInfoData.do", produces="text/plain;charset=utf-8")
	public String mypage_myinfoData(MemberVO vo,HttpSession session) {
		String json="";
		try {
			String id=(String)session.getAttribute("id");
			vo=service.myInfo(id);
			
//			System.out.println("fileName: "+vo.getProfile_name());
//			System.out.println("fileUrl: "+vo.getProfile_url());
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@PostMapping(value="mypage/update_my_info.do", produces="text/plain;charset=utf-8")
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public String mypage_update_my_info(MemberVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		// 이미지 저장 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/") +"profileImage\\";
		path=path.replace("\\", File.separator);
	   
		// 폴더가 없을 경우 자동으로 폴더 생성
	    File dir = new File(path);
	    if (!dir.exists()) {
	        dir.mkdirs(); // 필요한 모든 상위 경로도 함께 생성
	    }
	    
//	    System.out.println("vo.getimage:"+vo.getImage());
	    
		MultipartFile mfile=vo.getImage();
//		System.out.println("mfile:"+mfile);
		
		if(vo.getImage() == null) {
			session.setAttribute("name", vo.getName());
			service.myInfoUpdate(vo);
		} else {
			String fileName="";
			long fileSize=0;
			fileName=mfile.getOriginalFilename();
			
			// 이미지 저장
			File file=new File(path+fileName);
			try {
				mfile.transferTo(file);
			}catch(Exception ex) {}
			
			fileSize=file.length();
			
			// 이미지 url 생성
			String contextPath = request.getContextPath();
			String profileImageUrl = contextPath + "/profileImage/" + fileName;
			
			String id=(String)session.getAttribute("id");
			vo.setId(id); // session에 저장된 Id값 저장
			vo.setProfile_name(fileName);
			vo.setProfile_size(file.length());
			vo.setProfile_url(profileImageUrl);
			
			session.setAttribute("profileImage", vo.getProfile_url());
			session.setAttribute("name", vo.getName());
			
			service.myProfileUpdate(vo);
			service.myInfoUpdate(vo);
		}
		return "ok";
	}
	
	//pwd update
	@PostMapping(value="mypage/pwd_update_ok.do", produces="application/json;charset=utf-8")
	public String mypage_pwd_update_ok(String newPwd,MemberVO vo) {
		String json="";
		String res="";
		try {
			String db_pwd=service.pwdCheck(vo);
			if(encoder.matches(vo.getPwd(),db_pwd)) {
				String pwd=encoder.encode(newPwd);
				vo.setPwd(pwd);
				service.passwordUpdate(vo);
			} else {
				res="nopwd";
			}
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/emailCheck.do",produces="text/plain;charset=utf-8")
	public String member_emailCheck(String email) {
		String result="no";
		int count=mservice.memberEmailCheck(email);
		if(count==0) {
			result="yes";
		}
		return result;
	}
	
	@GetMapping(value="mypage/phoneCheck.do",produces="text/plain;charset=utf-8")
	public String member_phoneCheck(String phone) {
		String result="";
		int count=mservice.memberPhoneCheck(phone);
		if(count==0) {
			result="yes";
		} else if(count==1) {
			result="no";
		}
		return result;
	}
	
	@PostMapping(value="mypage/myPwdCheck.do",produces = "text/plain;charset=utf-8")
	public String member_pwd_check(MemberVO vo) {
		String json="";
		try {
			String db_pwd=service.pwdCheck(vo);
			if(encoder.matches(vo.getPwd(),db_pwd)) {
				vo.setMsg("ok");
			} else {
				vo.setMsg("no");
			}
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
}
