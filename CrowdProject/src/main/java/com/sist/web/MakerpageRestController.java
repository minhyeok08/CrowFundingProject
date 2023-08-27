package com.sist.web;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@CrossOrigin("*")
public class MakerpageRestController {
	@Autowired
	private FundDAO dao;
	@Autowired
	private MyPageDAO mydao;
	@Autowired
	private QnADAO qnadao;
	
	@GetMapping(value = "makerpage/project_list_for_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_list_for_reward(int page,String id) throws Exception
	{
		Map map = new HashMap();
		int rowSize=4;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		List<FundVO> list = dao.projectListDataForReward(map);
		for(FundVO vo:list)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dbopenday= sdf.format(vo.getOpenday());
			String dbendday=sdf.format(vo.getEndday());
			vo.setStropenday(dbopenday);
			vo.setStrendday(dbendday);
			String ftitle = vo.getFtitle();
			if(ftitle.length()>12)
			{
				ftitle=ftitle.substring(0,12)+"...";
				vo.setFtitle(ftitle);
			}
			
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/page_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_list(int page,String id) throws Exception
	{
		int totalpage=dao.projectrewardnoTotalpage(id);
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo = new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "makerpage/project_detail_for_reward_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_detail_for_reward(int wfno) throws Exception
	{
		FundVO vo = dao.projectDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
		int aim_amount = vo.getAim_amount();
		String str_aim_amount= df.format(aim_amount);
		vo.setStr_aim_amount(str_aim_amount);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/project_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_detail_reward(int wfno) throws Exception
	{
		FundVO vo = dao.projectDetailData(wfno);
		DecimalFormat df = new DecimalFormat("###,###,###");
		int aim_amount = vo.getAim_amount();
		int cum_amount=vo.getCum_amount();
		int parti_count=vo.getParti_count();
		int achieve_rate=vo.getAchieve_rate();
		String str_aim_amount= df.format(aim_amount);
		String str_cum_amount=df.format(cum_amount);
		String str_parti_count=df.format(parti_count);
		String str_achieve_rate = df.format(achieve_rate);
		vo.setStr_aim_amount(str_aim_amount);
		vo.setStr_cum_amount(str_cum_amount);
		vo.setStr_parti_count(str_parti_count);
		vo.setStr_achieve_rate(str_achieve_rate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dbopenday= sdf.format(vo.getOpenday());
		String dbendday=sdf.format(vo.getEndday());
		vo.setStropenday(dbopenday);
		vo.setStrendday(dbendday);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/project_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_list(int page,String id,int acno) throws Exception
	{
		Map map = new HashMap();
		int rowSize=4;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		map.put("acno", acno);
		List<FundVO> list = dao.projectListData(map);
		for(FundVO vo:list)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dbopenday= sdf.format(vo.getOpenday());
			String dbendday=sdf.format(vo.getEndday());
			vo.setStropenday(dbopenday);
			vo.setStrendday(dbendday);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yy년M월d일 오픈예정");
			String opendaykor=sdf2.format(vo.getOpenday());
			vo.setOpendaykor(opendaykor);
			String ftitle=vo.getFtitle();
			if(ftitle.length()>12)
			{
				ftitle=ftitle.substring(0,12)+"...";
			}
			vo.setFtitle(ftitle);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/page_Oklist_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_Oklist(int page,String id,int acno) throws Exception
	{
		Map map = new HashMap();
		map.put("id", id);
		map.put("acno", acno);
		int totalpage=dao.projectrewardOkTotalpage(map);
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo = new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/reward_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_list(int wfno) throws Exception
	{
		List<RewardVO> list = dao.rewardListData(wfno);
		for(RewardVO vo:list)
		{
			DecimalFormat df = new DecimalFormat("###,###,###");
			String strrprice= df.format(vo.getRprice())+"원";
			vo.setStrrprice(strrprice);
			if(vo.getDelfee()!=0)
			{
				String strdelfee= df.format(vo.getDelfee())+"원";
				vo.setStrdelfee(strdelfee);
			}
			else
			{
				vo.setStrdelfee("무료배송");
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/reward_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_detail(int rno) throws Exception
	{
		RewardVO vo = dao.reward_detail(rno);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/reward_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String reward_delete(int rno,int wfno) throws Exception
	{
		dao.reward_delete(rno);
		List<RewardVO> list = dao.rewardListData(wfno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/project_list_for_news_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_list_for_news(String id) throws Exception
	{
		List<FundVO> list = dao.project_list_for_news(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@PostMapping(value = "makerpage/news_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String databoard_insert(NewsVO vo,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/")+"newsfiles\\";
		path=path.replace("\\", File.separator);
		// 폴더가 없을 경우 자동으로 폴더 생성
	    File dir = new File(path);
	    if (!dir.exists()) {
	        dir.mkdirs(); // 필요한 모든 상위 경로도 함께 생성
	    }
		List<MultipartFile> list = vo.getFundfiles();

		if(list==null)
		{
//			System.out.println("파일 업로드가 없습니다.");
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		else
		{
//			System.out.println("파일이 "+list.size()+"개 업로드 됨");
			String filename="";
			String filesize="";
			for(MultipartFile mf:list)
			{
				String name=mf.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				name = uuid.toString()+"_"+name;
				File file = new File(path+name);
				try
				{
					mf.transferTo(file); // 업로드
				}catch(Exception ex) {}
				System.out.println("파일:"+file.length());
				filename+=name+",";
				filesize+= file.length()+",";
			}
			filename=filename.substring(0,filename.lastIndexOf(","));
			filesize=filesize.substring(0,filesize.lastIndexOf(","));
			vo.setFilecount(list.size());
			vo.setFilename(filename);
			vo.setFilesize(filesize);
		}
		dao.news_insert(vo);
		return "ok";
	}
	@GetMapping(value = "makerpage/news_find_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String newsFindlistData(String id,int page,int fdno,String fd) throws Exception
	{
		Map map = new HashMap();
		int rowSize=8;
		int start = (rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		map.put("fdno", fdno);
		map.put("fd", fd);
		List<NewsVO> list = dao.newsFindListData(map);
		String[] tname= {"","결제","교환/환불/AS","이벤트","리워드 안내","기타"};
		for(NewsVO vo:list)
		{
			vo.setTname(tname[vo.getTno()]);
			String ftitle = vo.getFtitle();
			if(ftitle.length()>22)
			{
				ftitle=ftitle.substring(0,22)+"...";
			}
			vo.setFtitle(ftitle);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/news_find_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String news_find_page(int page,String id,int fdno,String fd) throws Exception
	{
		Map map = new HashMap();
		map.put("id", id);
		map.put("fdno", fdno);
		map.put("fd", fd);
		int totalpage=dao.newsFindListTotalPage(map);
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo = new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/makerpage_news_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String makerpage_news_detail_vue(int no) throws Exception
	{
		NewsVO vo = dao.makerNewsDetailData(no);
		String[] tname= {"","결제","교환/환불/AS","이벤트","리워드 안내","기타"};
		vo.setTname(tname[vo.getTno()]);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@PostMapping(value = "makerpage/news_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String databoard_update(NewsVO vo,HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/")+"newsfiles\\";
		path=path.replace("\\", File.separator);
		List<MultipartFile> list = vo.getFundfiles();
		
		if(list==null)
		{
//			System.out.println("파일 업로드가 없습니다.");
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		else
		{
//			System.out.println("파일이 "+list.size()+"개 업로드 됨");
			String filename="";
			String filesize="";
			for(MultipartFile mf:list)
			{
				String name= mf.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				name = uuid.toString()+"_"+name;
				File file = new File(path+name);
				try
				{
					mf.transferTo(file); // 업로드
				}catch(Exception ex) {}
				filename+=name+",";
				filesize+= file.length()+",";
			}
			filename=filename.substring(0,filename.lastIndexOf(","));
			filesize=filesize.substring(0,filesize.lastIndexOf(","));
			vo.setFilecount(list.size());
			vo.setFilename(filename);
			vo.setFilesize(filesize);
		}
		dao.makerNewsUpdate(vo);
		return "ok";
	}
	@GetMapping(value = "makerpage/makerpage_news_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public void makerpage_news_delete(int no,HttpServletRequest request)
	{
		NewsVO vo = dao.newstableFileInfoData(no);
		if(vo.getFilecount()!=0)
		{
			String path=request.getSession().getServletContext().getRealPath("/")+"newsfiles\\";
			path=path.replace("\\", File.separator);
			StringTokenizer st = new StringTokenizer(vo.getFilename(),",");
			while(st.hasMoreTokens())
			{

				File file = new File(path);
				file.delete();
			}
		}
		dao.maker_news_delete(no);
	}
	@GetMapping(value = "makerpage/makerpage_project_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public void project_for_reward_delete(int wfno,HttpServletRequest request)
	{
		FundVO vo = dao.projectFileInfoData(wfno);
		if(!vo.getMainimg().contains("http"))
		{
			String path=request.getSession().getServletContext().getRealPath("/")+"Fundimages\\";
			path=path.replace("\\", File.separator);
			String files=vo.getMainimg()+"^"+vo.getMakerphoto()+"^"+vo.getDetailimg();
			StringTokenizer st = new StringTokenizer(files,"^");
			while(st.hasMoreTokens())
			{
				path=path+st.nextToken();
				File file = new File(path);
				file.delete();
			}	
		}	
		dao.projectDelete(wfno);
		
	}
	@GetMapping(value = "makerpage/makerpage_home_vue.do",produces = "text/plain;charset=UTF-8")
	public String makerpage_home(String id,int acno,int page) throws Exception
	{
		Map map = new HashMap();
		int rowSize=4;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		map.put("acno", acno);
		List<FundVO> list = dao.projectListData(map);
		for(FundVO vo:list)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dbopenday= sdf.format(vo.getOpenday());
			String dbendday=sdf.format(vo.getEndday());
			vo.setStropenday(dbopenday);
			vo.setStrendday(dbendday);
			String ftitle = vo.getFtitle();
			if(ftitle.length()>15)
			{
				ftitle=ftitle.substring(0,15)+"...";
			}
			vo.setFtitle(ftitle);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "makerpage/makerpage_home_project_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String makerpage_home_project_page(int acno,String id, int page) throws Exception
	{
		Map map = new HashMap();
		map.put("id", id);
		map.put("acno", acno);
		int totalpage=dao.makerpagehomeprojectTotalpage(map);
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		PageVO vo = new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "makerpage/userinfno_vue.do",produces = "text/plain;charset=UTF-8")
	public String makerpage_userinfo(String id) throws Exception
	{
		MemberVO vo = mydao.myInfo(id);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@PostMapping(value = "makerpage/project_delete_ok_vue.do",produces = "text/plain;charset=UTF-8")
	public String project_delete_all(String id,String pwd,int wfno)
	{
		String result="";
		boolean bCheck = dao.projectDeleteAll(id, pwd, wfno);
		if(bCheck==true)
		{
			result="ok";
		}
		else
		{
			result="no";
		}
		return result;
	}
	@PostMapping(value = "makerpage/QnA_question_vue.do",produces = "text/plain;charset=UTF-8")
	public void user_QuestionInsert(QnAVO vo)
	{	
		Map map = new HashMap();
		map.put("wfno", vo.getWfno());
		map.put("id", vo.getId());
		map.put("subject", vo.getSubject());
		map.put("content", vo.getContent());
		qnadao.qnaInsert(map);
	}
}	