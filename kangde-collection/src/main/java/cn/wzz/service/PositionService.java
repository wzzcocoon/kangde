package cn.wzz.service;

import java.util.List;

import cn.wzz.bean.Position;

public interface PositionService {

	List<Position> selectAll();

	int addPos(Position position);

	int edit(Position position);

	int del(Position position);

}
