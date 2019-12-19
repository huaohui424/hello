package com.controller.product;

import com.entity.Product;
import com.entity.Users;
import com.github.pagehelper.PageInfo;
import com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    //根据类型查询商品
    @RequestMapping("/productClassify")
    public ModelAndView productClassify(String type){
        ModelAndView view = new ModelAndView();
        List<Product> product = productService.classify(type);
        view.addObject("product",product);
        view.setViewName("bar/index");
        return view;
    }

    //查询所有的商品
    @RequestMapping("/listProduct")
    public ModelAndView listUsers( @RequestParam(value = "pageNum",defaultValue = "1",required = false) int pageNum,
                                   @RequestParam(value = "pageSize",defaultValue = "11",required = false)int pageSize){
        ModelAndView view = new ModelAndView();
        List<Product> result= productService.getAllProduct(pageNum,pageSize);
        PageInfo<Product> pageInfo = new PageInfo<>(result,2);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("product/list_product");
        return view;
    }
    //调准到添加商品页面
    @RequestMapping("/insertProduct")
    public String insert(){
        return "product/insert_product";
    }
    //添加商品
    @RequestMapping("/insertProductDo")
    public String insertComputer(String productName, Double productPrice, String productType, Integer productCount, String productComment, MultipartFile myfile){
        String directory = "D:\\packge\\spring-myinternet-bar\\spring-internet-controller\\web\\WEB-INF\\image";
        //得到上传过来的文件名
        String filename = myfile.getOriginalFilename();
        String path = directory + File.separator + filename;
        File file = new File(path);
        try {
            myfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Product product = new Product();
        product.setProductName(productName);
        product.setProductPrice(productPrice);
        product.setProductType(productType);
        product.setProductCount(productCount);
        product.setProductComment(productComment);
        product.setProductImage(filename);
        productService.insertProduct(product);

        return "forward:listProduct";
    }
    //跳转到修改商品信息页面
    @RequestMapping("/updateProduct")
    public ModelAndView update(Integer productId){
        ModelAndView view = new ModelAndView();
        Product product = productService.getById(productId);
        view.addObject("product",product);
        view.setViewName("product/update_product");
        return view;
    }
    //修改商品信息
    @RequestMapping("/amendProduct")
    public String updateDo(String productName, Double productPrice, String productType, Integer productCount, String productComment, MultipartFile myfile){
        String directory = "D:\\packge\\spring-myinternet-bar\\spring-internet-controller\\web\\WEB-INF\\image";
        //得到上传过来的文件名
        String filename = myfile.getOriginalFilename();
        String path = directory + File.separator + filename;
        File file = new File(path);
        try {
            myfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("商品名称："+productName);
        System.out.println("价格："+productPrice);
        System.out.println("类型："+productType);
        Product product = new Product();
        product.setProductName(productName);
        product.setProductPrice(productPrice);
        product.setProductType(productType);
        product.setProductCount(productCount);
        product.setProductComment(productComment);
        product.setProductImage(filename);
        productService.updateProduct(product);
        return "forward:listProduct";
    }
    //删除商品
    @RequestMapping("/deleteProduct")
    public String deleteUsers(Integer productId){
        productService.delete(productId);
        return "forward:listProduct";
    }


}
