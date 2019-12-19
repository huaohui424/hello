package com.dao;

import com.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//员工类
public interface AdminDao {
    //全部员工
    List<Admin> getAllAdmin(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //登录查询，查询一个用户名
    Admin checkAdmin(String adminUsername);
    //查询一个员工
    Admin getById(int adminId);
    //增加员工
    int insertAdmin(Admin admin);
    //修改员工
    int updateAdmin(Admin admin);
    //删除员工
    int delete(int id);

}
