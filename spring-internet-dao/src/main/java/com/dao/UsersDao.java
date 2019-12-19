package com.dao;

import com.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;
//客户类
public interface UsersDao {
    //全部客户
    List<Users> getAllUser(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //查询一条客户记录
    Users getById(int usersId);
    //增加客户
    int insertUser(Users users);
    //修改客户
    int updateUser(Users users);
    //删除客户
    int delete(int usersId);
}
