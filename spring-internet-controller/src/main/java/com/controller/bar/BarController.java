package com.controller.bar;

import com.entity.Computer;
import com.github.pagehelper.PageInfo;
import com.service.ComputerService;
import com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BarController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ComputerService computerService;

    @RequestMapping("/")
    public ModelAndView index(@RequestParam(value = "pageNum",defaultValue = "1",required = false) int pageNum,
                        @RequestParam(value = "pageSize",defaultValue = "9",required = false)int pageSize,String productType){
        ModelAndView view = new ModelAndView();

        List<Computer> result= computerService.getAll(pageNum,pageSize);
        PageInfo<Computer> pageInfo = new PageInfo<>(result,2);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("bar/index");
        return view;
    }



}
