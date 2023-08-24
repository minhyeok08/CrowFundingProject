package com.sist.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.NoticeService;
import com.sist.vo.ReviewVO;

@Controller
public class FundCommunityController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("fund/fund_community.do")
	public String fund_community(int wfno,Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		model.addAttribute("wfno",wfno);
		return "fund/fund_detail_community";
	}
	
	@PostMapping(value = "fund/review_insert_ok.do", produces = "text/plain;charset=UTF-8")
	public String review_insert(ReviewVO vo,HttpSession session,HttpServletRequest request) {
		String path=request.getSession().getServletContext().getRealPath("/")+"reviewImg\\";
		path=path.replace("\\", File.separator);
		System.out.println(path);
		List<MultipartFile> images = vo.getImages();
		if(images==null) {
			vo.setImgname("");
			vo.setImgsize("");
			vo.setImgpath("");
		}else {
			String filenames="";
			String filesizes="";
			for(MultipartFile mf:images) {
				String name=mf.getOriginalFilename();
				File file=new File(path+name);
				try {
					mf.transferTo(file);
				} catch (Exception e) {}
				filenames+=name+"^";
				long fileSizeKB = file.length() / 1024;
			    filesizes += fileSizeKB + "^";
			}
			filenames=filenames.substring(0,filenames.lastIndexOf("^"));
			filesizes=filesizes.substring(0,filesizes.lastIndexOf("^"));
			vo.setImgname(filenames);
			vo.setImgsize(filesizes);
			vo.setImgpath(path);
		}
		service.reviewInsert(vo);
		ReviewVO rvo=service.imgInsertvo();
		rvo.setImgname(vo.getImgname());
		rvo.setImgsize(vo.getImgsize());
		rvo.setImgpath(vo.getImgpath());
		if(rvo.getImgsize().equals("0")) {
			System.out.println("이미지 업로드 안함");
		}else {
			service.reviewImgInsert(rvo);
		}
		return "redirect:../fund/fund_community.do?wfno="+vo.getWfno();
	}
}
