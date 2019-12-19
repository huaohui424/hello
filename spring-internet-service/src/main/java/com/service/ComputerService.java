package com.service;

import com.dao.ComputerDao;
import com.entity.Computer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ComputerService {
    @Autowired
    private ComputerDao computerDao;

    public List<Computer> getAll(int pageNum,int pageSize){
        return computerDao.getAll(pageNum,pageSize);
    }

    public Computer getById(int computerId){
        return computerDao.getById(computerId);
    }

    public int insert(Computer computer){
        return computerDao.insert(computer);
    }

    public int update(Computer computer){
        return computerDao.update(computer);
    }

    public Integer delete(int computerId){
        return computerDao.delete(computerId);
    }

}
