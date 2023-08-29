package com.sist.web;

import java.io.File;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
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
import com.sist.dao.CuponDAO;
import com.sist.dao.MyPageDAO;
import com.sist.service.MemberServiceImpl;
import com.sist.service.MyPageServiceImpl;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.BuyVO;
import com.sist.vo.CuponVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnAVO;
import com.sist.vo.RewardVO;
import com.sist.vo.StoreVO;
import com.sist.vo.SupVO;

@RestController
public class MyPageRestController {
	@Autowired
	private MyPageServiceImpl service;
	@Autowired
	private MemberServiceImpl mservice;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private CuponDAO dao;
	@Autowired
	private MyPageDAO mdao;
	
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
			session.setAttribute("nickname", vo.getNickname());
			
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
	
	@GetMapping(value="mypage/myFundCount.do",produces = "text/plain;charset=utf-8")
	public String mypage_myFund_count(BuyVO vo) {
		String json="";
		try {
			int count = service.myFundCount(vo.getId());
			if(count == 0) {
				vo.setMsg("noCount");
				vo.setFcount(0);
			} else {
				vo.setMsg("ok");
				vo.setFcount(count);
			}
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/myFundData.do",produces = "text/plain;charset=utf-8")
	public String mypage_myFund_list_data(String id) {
		String json="";
		try {
			List<BuyVO> list=service.myFundDetail(id);
			Date today=new Date();
			for(BuyVO vo:list) {
				if(vo.getEndday().after(today)) {
					vo.setFundStatus("진행중");
				} else if(vo.getEndday().before(today) || vo.getEndday().equals(today)) {
					vo.setFundStatus("종료");
				}
				// ( tpricce ) - (배송비 + 포인트 사용 금액)
				int totalPrice=vo.getTprice()-vo.getDelfee()-vo.getUsepoint();
				vo.setTotalPrice(totalPrice);
			}
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/my_funding_jjim.do",produces = "text/plain;charset=utf-8")
	public String mypage_my_funding_jjim(String id) {
		String json="";
		List<FundVO> list=service.jjimListData(id);
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/my_store_jjim.do",produces = "text/plain;charset=utf-8")
	public String mypage_store_jjim(String id) throws Exception {
		List<StoreVO> list=service.storeJjimListData(id);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value="mypage/my_qna_maker_data.do",produces = "text/plain;charset=utf-8")
	public String mypage_qna_maker(String id) {
		String json="";
		List<QnAVO> list=service.myQnaListData(id);
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/my_qna_delete.do", produces = "text/plain;charset=utf-8")
	public void mypage_qna_delete(QnAVO vo) throws Exception {
		mdao.myQnaDelete(vo);
	}
	
	@GetMapping(value="mypage/my_qna_maker_reply.do", produces="text/plain;charset=utf-8")
	public String mypage_my_qna_maker_reply(int group_id) {
		QnAVO vo = new QnAVO();
		vo=service.myQnaReplyData(group_id);
		String json="";
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/my_follow_vue.do",produces="text/plain;charset=utf-8")
	public String mypage_my_follow(String id) {
		List<SupVO> list=service.myFollowing(id);
		String json="";
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/my_qna_admin_data.do",produces = "text/plain;charset=utf-8")
	public String mypage_qna_admin_data(String id) throws Exception {
		List<AdminqnaVO> list=service.qnaDetailData(id);
		
		LocalDateTime now = LocalDateTime.now();
		
		for(AdminqnaVO vo: list) {
			LocalDateTime regdate = vo.getRegdate().toInstant()
					.atZone(ZoneId.systemDefault()).toLocalDateTime();
			Duration duration = Duration.between(regdate, now);
			
			String dbday;
			
			if (duration.toDays() > 0) {
	            dbday = duration.toDays() + "일 전";
	        } else if (duration.toHours() > 0) {
	            dbday = duration.toHours() + "시간 전";
	        } else if (duration.toMinutes() > 0) {
	            dbday = duration.toMinutes() + "분 전";
	        } else {
	            dbday = duration.getSeconds() + "초 전";
	        }
	        
	       vo.setDbday(dbday);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
		
	}
	
	@PostMapping(value="mypage/my_qna_admin_vue.do",produces = "text/plain;charset=utf-8")
	public String mypage_qna_admin_insert(AdminqnaVO vo,String id) throws Exception {
		service.qnaInsert(vo);
		
		String sysid=vo.getId();
		String content=vo.getContent();
		String profileUrl=vo.getProfile_url();
		String name=vo.getName();
		
		System.out.println("sysid:"+sysid+"content:"+content+"profileUrl:"+profileUrl+"name:"+name);
		
		List<AdminqnaVO> list=service.qnaDetailData(id);
		LocalDateTime now = LocalDateTime.now();
		
		for(AdminqnaVO avo: list) {
			LocalDateTime regdate = avo.getRegdate().toInstant()
					.atZone(ZoneId.systemDefault()).toLocalDateTime();
			Duration duration = Duration.between(regdate, now);
			
			String dbday;
			
			if (duration.toDays() > 0) {
	            dbday = duration.toDays() + "일 전";
	        } else if (duration.toHours() > 0) {
	            dbday = duration.toHours() + "시간 전";
	        } else if (duration.toMinutes() > 0) {
	            dbday = duration.toMinutes() + "분 전";
	        } else {
	            dbday = duration.getSeconds() + "초 전";
	        }
	        
	       avo.setDbday(dbday);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value="mypage/all_cupon_vue.do", produces = "text/plain;charset=utf-8")
	public String mypage_all_cupon_data() {
		List<CuponVO> list=dao.cuponListData();
		
		String json="";
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value="mypage/cupon_insert_vue.do", produces = "text/plain;charset=utf-8")
	public String mypage_cupon_insert(CuponVO vo) throws Exception {
		int downloadCount=dao.cuponValidate(vo);
		String result="";
		if(downloadCount == 0) {
			dao.cuponInsert(vo);
			result="success";
		} else {
			result="fail";
		}
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(result);
		return json;
	}
	
	@GetMapping(value="mypage/my_cupon_vue.do",produces = "text/plain;charset=utf-8")
	public String mypage_my_cupon(String id) throws Exception {
		String json="";
		
		List<CuponVO> list=dao.myCuponListData(id);
		
		ObjectMapper mapper=new ObjectMapper();
		json=mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value="mypage/my_cupon_count.do",produces = "text/plain;charset=utf-8")
	public String mypage_my_cupon_count(String id) throws Exception {
		int count = dao.myCuponCount(id);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(count);
		
		return json;
	}
	
}