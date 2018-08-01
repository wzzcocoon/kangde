package cn.wzz.service;

import java.util.List;

import cn.wzz.bean.Organization;

public interface OrganizationService {

	List<Organization> selectAll();

	List<Organization> selectOrg(Integer start,Integer rows);

	int addOrg(Organization organization);

	int edit(Organization organization);

	int del(Organization organization);


}
