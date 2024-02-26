package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainingController {
	@GetMapping("training/training_list.do")
	public String training_list()
	{
		return "training/training_list";
	}
	@GetMapping("training/training_list_detail.do")
	public String train_list_detail(int tno,Model model)
	{
		model.addAttribute("tno", tno);
		return "training/training_list_detail";   
	}
}
