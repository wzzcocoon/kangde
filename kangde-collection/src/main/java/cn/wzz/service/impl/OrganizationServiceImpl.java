package cn.wzz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wzz.bean.Organization;
import cn.wzz.mapper.OrganizationMapper;
import cn.wzz.service.OrganizationService;

@Service
public class OrganizationServiceImpl implements OrganizationService{

	@Autowired
	private OrganizationMapper organizationMapper;

	@Override
	public List<Organization> selectAll() {
		List<Organization> selectAll = organizationMapper.selectAll();
		return selectAll;
	}


	@Override
	public List<Organization> selectOrg(Integer start,Integer rows) {
		Map<Object,Object> map = new HashMap<Object,Object>();
		map.put("start", start);
		map.put("rows", rows);
		return organizationMapper.selectOrg(map);
	}
	
	@Override
	public int addOrg(Organization organization) {
		return organizationMapper.insert(organization);
	}

	@Override
	public int edit(Organization organization) {
		return organizationMapper.updateByPrimaryKey(organization);
	}

	@Override
	public int del(Organization organization) {
		return organizationMapper.deleteByPrimaryKey(organization.getId());
	}

	
}
