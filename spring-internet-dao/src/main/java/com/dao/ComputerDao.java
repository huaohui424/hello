package com.dao;

import com.entity.Computer;
import org.apache.ibatis.annotations.Param;

import java.util.List;
//电脑类
public interface ComputerDao {
    //全部电脑
    List<Computer> getAll(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    //查询一台电脑
    Computer getById(int computerId);
    //添加电脑
    int insert(Computer computer);
    //修改电脑
    int update(Computer computer);
    //删除电脑
    Integer delete(int computerId);
}
