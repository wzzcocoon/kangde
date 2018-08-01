package cn.wzz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/goto_Organization")
	public String goto_Organization() {
		return "organization";
	}
	
	@RequestMapping("/goto_Employee")
	public String goto_Employee() {
		return "employee";
	}

	@RequestMapping("/goto_Position")
	public String goto_Position() {
		return "position";
	}
}
