package com.sist.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.ListDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ProfileVO;

@Controller
public class WastaController {
	@Autowired
	private ListDAO dao;

	@GetMapping("wasta/main.do")
	public String wasta_main() {
		return "wasta/wastamain";
	}
	
	@RequestMapping("wasta/list.do")
	public String wasta_list() {
		return "wasta/wastalist";
	}

	@RequestMapping("wasta/insert.do")
	public String wasta_insert() {
		return "wasta/wastaInsert";
	}
	
	@RequestMapping("wasta/test.do")
	public String wasta_test(Model model,String id) {
		List<ProfileVO> list=dao.profileData(id);
		for(ProfileVO vo:list) {
		if(vo.getProfile_img_path()==null) {
				vo.setProfile_img_path("bb");
			}
		}
		model.addAttribute("list",list);
		return "wasta/test";
	}

	@RequestMapping("wasta/insert_ok.do")	// 이 부분은 id를 받아오기 위함이므로, String id로 바꾸기.
	public String wasta_insert_ok(Model model, @ModelAttribute MemberVO vo, @RequestParam("profileImg") MultipartFile file) {
	    if (!file.isEmpty()) {
	        try {
	            // 파일 저장 경로 설정 (프로젝트 내의 폴더 사용)
	            String uploadDir = "C:\\Users\\SIST\\Desktop\\upload";
	            // 중복없는 파일명을 위한 랜덤
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            String contentType = file.getContentType();
	            System.out.println(contentType);
	            long fileSize = file.getSize();

	            // 파일을 지정된 경로에 저장
	            Path filePath = Paths.get(uploadDir, fileName);
	            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	            // 회원 정보와 프로필 사진 정보를 데이터베이스에 저장
	            ProfileVO pvo = new ProfileVO();
	            pvo.setImg_size(String.valueOf(fileSize));
	            pvo.setImg_name(fileName);
	            pvo.setId(vo.getId());
	            pvo.setProfile_img_path(uploadDir + fileName); // 파일의 경로를 저장

	            dao.profileInsert(pvo);

	            // 파일 업로드 성공 처리
	            return "redirect:../wasta/list.do";
	        } catch (IOException e) {
	            // 파일 업로드 실패 처리
	            e.printStackTrace();
	        }
	    } else {
	        // 업로드할 파일이 없을 경우 처리
	    }
	    return "redirect:../wasta/list.do";
	}
	
	@RequestMapping("wasta/profileImage.do")
	@ResponseBody
	public ResponseEntity<byte[]> getProfileImage(Model model) {
		String aid="hong";
	    List<ProfileVO> list = dao.profileData(aid);
	    if (list != null) {
	        try {
	        	for(ProfileVO vo:list) {
	            String imagePath = vo.getProfile_img_path(); // 경로와 파일 이름을 가져옴
	            System.out.println(imagePath);
	            File imageFile = new File(imagePath);
	            if (imageFile.exists()) {
	                // 파일이 존재하는 경우 이미지를 읽어와서 출력
	                byte[] imageBytes = Files.readAllBytes(imageFile.toPath());
	                HttpHeaders headers = new HttpHeaders();
	                headers.setContentType(MediaType.IMAGE_PNG); // 이미지 타입 설정 (이미지 타입에 따라 변경 가능)
	                return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	            
	            } else {
	                // 파일이 존재하지 않는 경우 처리
	                System.out.println("File not found: " + imagePath);
	            }
	        }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}



}
