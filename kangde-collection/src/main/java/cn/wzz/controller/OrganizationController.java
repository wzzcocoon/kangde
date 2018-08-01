package cn.wzz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wzz.bean.Organization;
import cn.wzz.service.OrganizationService;

@Controller
@RequestMapping("org")
public class OrganizationController {

	@Autowired
	private OrganizationService organizationService;

	/**同步查询的方法*/
	@Deprecated
	@RequestMapping("/goto_org")
	public String goto_org(ModelMap map) {
		List<Organization> list_org = organizationService.selectAll();
		map.put("list_org", list_org);
		return "organization";
	}

	@Deprecated
	@RequestMapping("/goto_orgAdd")
	public String goto_orgAdd() {
		return "org/organizationAdd";
	}
	
	@ResponseBody
	@RequestMapping("/goto_org_ajax")
	public Object goto_org_ajax(Integer page,Integer rows) {
		int start = (page-1) * rows ;			
		
		List<Organization> list_Allorg = organizationService.selectOrg(start,rows);
		List<Organization> list_org = organizationService.selectAll();
		
		Map<String, Object> map = new HashMap<String,Object>(); 
		map.put("total", list_Allorg.size());
		map.put("rows", list_org);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String add(Organization organization) {
		/**
			       version 版本（修改后更新）
			        status 系统状态
				  order_no 排序号
					  code 机构编码
		      principal_id 机构负责人Id
					  path 机构路径
		 */
		//organization.setCreateTime(new Date());
		int count = organizationService.addOrg(organization);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/edit")
	public String edit(Organization organization) {
		int count = organizationService.edit(organization);
		if(count > 0) {
			return "1";
		}else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delOrg(Organization organization) {
		int count = organizationService.del(organization);
		if(count != -1) {
			return "1";
		}else {
			return "2";
		}
	}
}
