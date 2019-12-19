package com.dao;

import com.entity.Spends;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpendsDao {
    List<Spends> getAllSpends(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
}
