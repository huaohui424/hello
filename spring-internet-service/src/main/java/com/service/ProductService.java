package com.service;

import com.dao.ProductDao;
import com.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;

    //商品
    public List<Product> getAllProduct(int pageNum,int pageSize){
        return productDao.getAllProduct(pageNum,pageSize);
    }
    //查询一条商品记录
    public Product getById(int productId){
        return productDao.getById(productId);
    }
    //增加商品
    public int insertProduct(Product product){
        return productDao.insertProduct(product);
    }
    //修改商品
    public int updateProduct(Product product){
        return productDao.updateProduct(product);
    }
    //删除商品
    public int delete(int productId){
        return productDao.delete(productId);
    }
    //商品分类
    public List<Product> classify(String productType,int pageNum,int pageSize){
        return productDao.classify(productType,pageNum,pageSize);
    }
}
