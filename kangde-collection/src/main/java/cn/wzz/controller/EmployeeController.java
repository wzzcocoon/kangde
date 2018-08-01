package cn.wzz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wzz.bean.Employee;
import cn.wzz.service.EmployeeService;
import cn.wzz.util.Data;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@ResponseBody
	@RequestMapping("/goto_emp_ajax")
	public Object goto_emp_ajax(Integer page,Integer rows) {
		//mysql> SELECT * FROM table LIMIT 5,10; //检索记录行6-15 
		//索引开始行 start		查询条数rows
		int start = (page-1) * rows ;			
												
		List<Employee> list_emp = employeeService.selectEmp(start,rows);
		List<Employee> list_Allemp = employeeService.selectAll();
		Map<String, Object> map = new HashMap<String,Object>(); 
		map.put("total", list_Allemp.size());
		map.put("rows", list_emp);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String add(Employee employee) {
		int count = employeeService.add(employee);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/edit")
	public String edit(Employee employee) {
		int count = employeeService.edit(employee);
		if(count > 0) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/del")
	public String del(Employee employee) {
		int count = employeeService.del(employee);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/editUpdateIn")
	public String editUpdateIn(Data data) {
		int count = employeeService.editUpdateIn(data);
		if(count > 0) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/editUpdateUp")
	public String editUpdateUp(Data data) {
		int count = employeeService.editUpdateUp(data);
		if(count > 0) {
			return "1";
		}else {
			return "2";
		}
	}
}
