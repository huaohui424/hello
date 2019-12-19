package com.service;

import com.dao.SpendsDao;
import com.entity.Spends;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpendsService {
    @Autowired
    private SpendsDao spendsDao;

    public List<Spends> getAllSpends (int pageNum,int pageSize){
        return spendsDao.getAllSpends(pageNum,pageSize);
    }
}
