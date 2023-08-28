package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	@GetMapping("store/store_list.do")
	public String store_list()
	{
		return "store/store_list";
	}
	
	@GetMapping("store/store_detail.do")
	public String store_detail(int wsno,Model model)
	{
		model.addAttribute("wsno",wsno);
		return "store/store_detail";
	}
}
