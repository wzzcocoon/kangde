package cn.wzz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wzz.bean.Position;
import cn.wzz.service.PositionService;


@Controller
@RequestMapping("pos")
public class PositionController {

	@Autowired
	private PositionService positionService;
	
	@ResponseBody
	@RequestMapping("/goto_pos_ajax")
	public Object goto_pos_ajax() {
		List<Position> list_pos = positionService.selectAll();
		return list_pos;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String add(Position position) {
		int count = positionService.addPos(position);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/edit")
	public String edit(Position position) {
		int count = positionService.edit(position);
		if(count > 0) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/del")
	public String del(Position position) {
		int count = positionService.del(position);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}
}
