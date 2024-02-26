package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ExerCalController {
	@GetMapping("exercise/exercise_list.do")
	public String exercise_list()
	{
	    return "exercise/exercise_list";
	}
	@GetMapping("exercise/exercise_list_detail.do")
	public String exer_list_detail(int eno,Model model)
	{
		model.addAttribute("eno", eno);
		return "exercise/exercise_list_detail";   
	}
	@GetMapping("exercise/exercise_find.do")
	public String exercise_find()
	{
		return "exercise/exercise_find";
    }
}
