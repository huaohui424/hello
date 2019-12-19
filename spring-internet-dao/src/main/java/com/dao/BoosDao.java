package com.dao;

import com.entity.Boos;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//老板类
public interface BoosDao {
    //全部老板
    List<Boos> getAllBoos(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //增加老板
    Boos insertBoos(Boos boos);
    //修改老板
    Boos updateBoos(Boos boos);
    //删除老板
    int delete(int id);
}
