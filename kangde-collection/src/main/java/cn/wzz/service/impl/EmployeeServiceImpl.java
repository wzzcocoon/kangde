package cn.wzz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wzz.bean.Employee;
import cn.wzz.mapper.EmployeeMapper;
import cn.wzz.service.EmployeeService;
import cn.wzz.util.Data;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper; 
	
	@Override
	public List<Employee> selectAll() {
		return employeeMapper.selectAll();
	}

	@Override
	public int add(Employee employee) {
		return employeeMapper.insert(employee);
	}

	@Override
	public int edit(Employee employee) {
		return employeeMapper.updateByPrimaryKey(employee);
	}

	@Override
	public int del(Employee employee) {
		return employeeMapper.deleteByPrimaryKey(employee.getId());
	}

	@Override
	public int editUpdateIn(Data data) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("empIds", data.getIds());
		return employeeMapper.editUpdateIn(paramMap);
	}

	@Override
	public int editUpdateUp(Data data) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("empIds", data.getIds());
		return employeeMapper.editUpdateUp(paramMap);
	}

	@Override
	public List<Employee> selectEmp(int start,Integer rows) {
		Map<Object,Object> map = new HashMap<Object,Object>();
		map.put("start", start);
		map.put("rows", rows);
		return employeeMapper.selectEmp(map);
	}

}
