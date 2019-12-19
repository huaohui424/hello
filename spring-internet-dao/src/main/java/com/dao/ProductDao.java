package com.dao;

import com.entity.Product;
import com.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//客户类
public interface ProductDao {
    //商品
    List<Product> getAllProduct(@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    //查询一条商品记录
    Product getById(int productId);
    //增加商品
    int insertProduct(Product product);
    //修改商品
    int updateProduct(Product product);
    //删除商品
    int delete(int productId);
    //商品分类
    List<Product> classify(String productType,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
}
