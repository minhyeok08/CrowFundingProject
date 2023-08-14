package com.sist.web;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class CrowdStoreController {
	@Autowired
	private CrowdStoreDAO dao;
	
	@GetMapping("crowd/store_list.do")
	public String store_list(Map map) {
		return "crowd/store_list";
	}
}
