package cn.wzz.mapper;

import cn.wzz.bean.Area;
import java.util.List;

public interface AreaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table area
     *
     * @mbggenerated Tue Apr 24 11:12:37 CST 2018
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table area
     *
     * @mbggenerated Tue Apr 24 11:12:37 CST 2018
     */
    int insert(Area record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table area
     *
     * @mbggenerated Tue Apr 24 11:12:37 CST 2018
     */
    Area selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table area
     *
     * @mbggenerated Tue Apr 24 11:12:37 CST 2018
     */
    List<Area> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table area
     *
     * @mbggenerated Tue Apr 24 11:12:37 CST 2018
     */
    int updateByPrimaryKey(Area record);
}