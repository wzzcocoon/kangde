package cn.wzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wzz.bean.Position;
import cn.wzz.mapper.PositionMapper;
import cn.wzz.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionMapper positionMapper;
	
	@Override
	public List<Position> selectAll() {
		return positionMapper.selectAll();
	}

	@Override
	public int addPos(Position position) {
		return positionMapper.insert(position);
	}

	@Override
	public int edit(Position position) {
		return positionMapper.updateByPrimaryKey(position);
	}

	@Override
	public int del(Position position) {
		return positionMapper.deleteByPrimaryKey(position.getId());
	}

}
