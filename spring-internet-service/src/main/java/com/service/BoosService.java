package com.service;

import com.dao.BoosDao;
import com.entity.Boos;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoosService {
    @Autowired
    private BoosDao boosDao;

    //全部老板
    public List<Boos> getAllBoos(int pageNum, int pageSize){
        return boosDao.getAllBoos(pageNum,pageSize);
    }
    //增加老板
    public Boos insertBoos(Boos boos){
        return boosDao.insertBoos(boos);
    }
    //修改老板
    public Boos updateBoos(Boos boos){
        return boosDao.updateBoos(boos);
    }
    //删除老板
    public int delete(int id){
        return boosDao.delete(id);
    }
}
