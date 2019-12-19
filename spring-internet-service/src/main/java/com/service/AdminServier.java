package com.service;

import com.dao.AdminDao;
import com.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServier {
    @Autowired
    private AdminDao adminDao;

    //全部员工
    public List<Admin> getAllAdmin(int pageNum, int pageSize){
        return adminDao.getAllAdmin(pageNum,pageSize);
    }
    //登录查询，查询一个用户名
    public Admin checkAdmin(String adminUsername){
        return adminDao.checkAdmin(adminUsername);
    }
    //查询一个员工
    public Admin getById(int adminId){
        return adminDao.getById(adminId);
    }

    //增加员工
    public int insertAdmin(Admin admin){
        return adminDao.insertAdmin(admin);
    }
    //修改员工
    public int updateAdmin(Admin admin){
        return adminDao.updateAdmin(admin);
    }
    //删除员工
    public int delete(int id){
        return adminDao.delete(id);
    }
}
