package cn.wzz.service;

import java.util.List;

import cn.wzz.bean.Employee;
import cn.wzz.util.Data;

public interface EmployeeService {

	List<Employee> selectAll();

	int add(Employee employee);

	int edit(Employee employee);

	int del(Employee employee);

	int editUpdateIn(Data data);

	int editUpdateUp(Data data);

	List<Employee> selectEmp(int start, Integer rows);

}
