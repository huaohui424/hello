package com.service;

import com.dao.UsersDao;
import com.entity.Admin;
import com.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersService {
    @Autowired
    private UsersDao usersDao;

    //全部员工
    public List<Users> getAllUser(int pageNum, int pageSize){
        return usersDao.getAllUser(pageNum,pageSize);
    }
    //一个员工
    public Users getById(int usersId){
        return usersDao.getById(usersId);
    }

    //增加员工
    public int insertUser(Users users){
        return usersDao.insertUser(users);
    }
    //修改员工
    public int updateUser(Users users){
        return usersDao.updateUser(users);
    }
    //删除员工
    public int delete(int usersId){
        return usersDao.delete(usersId);
    }
}
