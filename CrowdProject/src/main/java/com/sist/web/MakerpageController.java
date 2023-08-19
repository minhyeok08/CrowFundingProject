package com.sist.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.FundDAO;
import com.sist.vo.FundVO;
import com.sist.vo.RewardVO;


@Controller
public class MakerpageController {
	@Autowired
	private FundDAO dao;
	// 홈 화면 이동
	@GetMapping("makerpage/makerpage_home.do")
	public String maker_main()
	{
		return "makerpage/makerpage_home";
	}
	// 프로젝트만들기 리스트 이동
	@GetMapping("makerpage/project_list_for_reward.do")
	public String project_list_for_reward()
	{
		return "makerpage/project_list_for_reward";
	}
	// 프로젝트 리스트 이동
	@GetMapping("makerpage/project_list.do")
	public String project_list()
	{
		return "makerpage/project_list";
	}
	// 프로젝트 등록
	@GetMapping("makerpage/fund_insert.do")
	public String project_insert()
	{
		return "makerpage/fund_insert";
	}
	// 프로젝트 등록 후 리스트 페이지로 이동
	@PostMapping("makerpage/fund_insert_ok.do")
	public String fund_insert_ok(FundVO vo,HttpSession session)
	{
		List<MultipartFile> list = vo.getFiles();
		System.out.println(list);
		String filenames="";
		for(MultipartFile mf:list)
		{
			File file = new File("C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CrowdProject\\WEB-INF\\Fundimages\\"+mf.getOriginalFilename());
			try
			{
				mf.transferTo(file);
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			filenames+=file.getName()+"^";
		}
		filenames=filenames.substring(0,filenames.lastIndexOf("^"));
		String makerphoto = filenames.substring(0,filenames.indexOf("^"));
		filenames=filenames.substring(filenames.indexOf("^")+1);
		String mainimg = filenames.substring(0,filenames.indexOf("^"));
		String detailimg=filenames.substring(filenames.indexOf("^")+1);
		vo.setMainimg(mainimg);
		vo.setMakerphoto(makerphoto);
		vo.setDetailimg(detailimg);
		int fcno = vo.getFcno();
		String[] fcatecno = {
	     		   "","테크·가전","패션·잡화","홈·리빙","뷰티","푸드","출판",
	     		   "클래스·컨설팅","레저·아웃도어","스포츠·모빌리티","컬쳐·아티스트","캐릭터·굿즈",
	     		   "반려동물","베이비·키즈","게임·취미","여행·숙박","기부·캠페인","후원","모임"
	 		   };
		String fcname = fcatecno[fcno];
		vo.setFcname(fcname);
		String stropenday = vo.getStropenday();
		String strendday = vo.getStrendday();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date openday = dateFormat.parse(stropenday);
			Date endday = dateFormat.parse(strendday);
			vo.setOpenday(openday);
			vo.setEndday(endday);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		dao.fundInsertData(vo);
		return "redirect: ../makerpage/project_list.do";
	}
	// 프로젝트 상세로 이동(reward등록을 위해서)
	@GetMapping("makerpage/project_detail_for_reward.do")
	public String project_detail_for_reward(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/project_detail_for_reward";
	}
	// 리워드 등록으로 이동
	@GetMapping("makerpage/reward_insert.do")
	public String reward_insert(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/reward_insert";
	}
	@PostMapping("makerpage/reward_insert_ok.do")
	public String reward_insert_ok(RewardVO vo)
	{
		
		dao.rewardInsertData(vo);
		dao.project_rewardOk(vo.getWfno());
		return "redirect: ../makerpage/project_list.do";
	}
	// 새소식 리스트 이동
	@GetMapping("makerpage/makerpage_news.do")
	public String maker_news()
	{
		return "makerpage/makerpage_news";
	}
	// 새소식 등록 페이지 이동
	@GetMapping("makerpage/makerpage_news_insert.do")
	public String maker_news_insert()
	{
		return "makerpage/makerpage_news_insert";
	}
	
}
