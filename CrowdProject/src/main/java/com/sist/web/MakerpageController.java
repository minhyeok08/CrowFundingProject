package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
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
	public String fund_insert_ok(FundVO vo,HttpSession session,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/")+"Fundimages\\";
		path=path.replace("\\", File.separator);
		List<MultipartFile> list = vo.getFiles();
//		System.out.println(list);
		String filenames="";
		for(MultipartFile mf:list)
		{
			String name=mf.getOriginalFilename();
			File file = new File(path+name);
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
		return "redirect: ../makerpage/project_list_for_reward.do";
	}
	// 프로젝트 상세로 이동(reward등록을 위해서)
	@GetMapping("makerpage/project_detail_for_reward.do")
	public String project_detail_for_reward(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/project_detail_for_reward";
	}
	// 프로젝트 상세로 이동(reward등록 되어 있는 상태)
	@GetMapping("makerpage/project_detail.do")
	public String project_detail(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/project_detail";
	}
	// 리워드 등록으로 이동
	@GetMapping("makerpage/reward_insert.do")
	public String reward_insert(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/reward_insert";
	}
	//리워드 등록
	@PostMapping("makerpage/reward_insert_ok.do")
	public String reward_insert_ok(RewardVO vo)
	{
		
		dao.rewardInsertData(vo);
		dao.project_rewardOk(vo.getWfno());
		return "redirect: ../makerpage/project_list.do";
	}
	// 리워드 수정
	@GetMapping("makerpage/reward_update.do")
	public String reward_update(int rno,Model model)
	{
		model.addAttribute("rno",rno);
		return "makerpage/reward_update";
	}
	@PostMapping("makerpage/reward_update_ok.do")
	public String reward_update_ok(RewardVO vo)
	{
		dao.reward_update_ok(vo);
		return "redirect: ../makerpage/project_detail.do?wfno="+vo.getWfno();
	}
	// 새소식 리스트 이동
	@GetMapping("makerpage/makerpage_news.do")
	public String maker_news(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		model.addAttribute("id",id);
		return "makerpage/makerpage_news";
	}
	// 새소식 등록 페이지 이동
	@GetMapping("makerpage/makerpage_news_insert.do")
	public String maker_news_insert(Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		model.addAttribute("id",id);
		return "makerpage/makerpage_news_insert";
	}
	// 프로젝트 수정하기
	@GetMapping("makerpage/project_update.do")
	public String project_update(int wfno,Model model)
	{
		model.addAttribute("wfno",wfno);
		return "makerpage/project_update";
	}
	@PostMapping("makerpage/project_update_ok.do")
	public String project_update_ok(FundVO vo,HttpSession session)
	{
		List<MultipartFile> list = vo.getFiles();
		System.out.println(list);
		String filenames="";
		for(MultipartFile mf:list)
		{
			File file = new File("C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CrowdProject\\Fundimages\\"+mf.getOriginalFilename());
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
		dao.project_update(vo);
		return "redirect: ../makerpage/project_list.do";
	}
	@GetMapping("makerpage/makerpage_news_detail.do")
	public String makerpage_news_detail(int no,Model model)
	{
		model.addAttribute("no",no);
		return "makerpage/makerpage_news_detail";
	}
	@GetMapping("makerpage/download.do")
	public void databoard_download(String fn,HttpServletResponse response,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/")+"newsfiles\\";
		path=path.replace("\\", File.separator);
		try
		{
			File file=new File(path+fn);
			response.setHeader("Content-Disposition", "attachement;filename="
					+URLEncoder.encode(fn,"UTF-8"));
			response.setContentLength((int)file.length());
			BufferedInputStream bis = 
					new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = 
					new BufferedOutputStream(response.getOutputStream());
			int i=0;
			byte[] buffer = new byte[1024];
			while((i=bis.read(buffer,0,1024))!=-1)
			{
				bos.write(buffer,0,i);
			}
			bis.close();
			bos.close();
		}catch(Exception ex) {}
	}
	@GetMapping("makerpage/makerpage_news_update.do")
	public String makerpage_news_update(int no ,Model model)
	{
		model.addAttribute("no",no);
		return "makerpage/makerpage_news_update";
	}
}
