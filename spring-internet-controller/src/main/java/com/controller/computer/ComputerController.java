package com.controller.computer;

import com.entity.Computer;
import com.service.ComputerService;
import com.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
@Controller
public class ComputerController {
    @Autowired
    private ComputerService computerService;


    //电脑操作
    @RequestMapping("/computer")
    public String computer(){
        return "computer/list_computer";
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResponseVO list(
            @RequestParam(value = "pageNum",defaultValue = "4",required = false) int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "11",required = false)int pageSize){
        List<Computer> result= computerService.getAll(pageNum,pageSize);
        ResponseVO success = ResponseVO.newBuilder().code("0").msg("success").data(result).build();
        return  success;
    }

    @RequestMapping("user")
    public String user(){
        return "users/list_users";
    }

    @RequestMapping("/insert")
    public String insert(){
        return "computer/insert_computer";
    }

    @RequestMapping("/insertComputer")
    public String insertComputer(Computer computer, HttpServletRequest request, MultipartFile myfile){
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

        String name = request.getParameter("Name");
        String type = request.getParameter("Type");
        double price = Double.parseDouble(request.getParameter("Price"));
        int count = Integer.valueOf(request.getParameter("Count"));
        String comment = request.getParameter("Comment");

        System.out.println("name:"+name+"type:"+type+"price"+price+"count:"+count+"comment:"+comment);
        computer.setComputerImage(filename);
        computer.setComputerName(name);
        computer.setComputerType(type);
        computer.setComputerPrice(price);
        computer.setComputerCount(count);
        computer.setComputerComment(comment);

        computerService.insert(computer);
        return "computer/list_computer";
    }


   @RequestMapping("/delete")
   public String delete(Integer computerId,String computerName){
       System.out.println(computerId);
       System.out.println(computerName);
       computerService.delete(computerId);
       return "computer/list_computer";
   }

   @RequestMapping("/update")
    public ModelAndView update(Integer computerId){
       ModelAndView view = new ModelAndView();
       Computer computer = computerService.getById(computerId);
       view.addObject("computer",computer);
       view.setViewName("computer/update_computer");
        return view;
   }

   @RequestMapping("/amend")
    public String updateDo(HttpServletRequest request,Integer Id, String Name, String Type, Double Price,Integer Count,String Comment,String sex,String open){
       String name = request.getParameter("Name");
       System.out.println("request  Name :"+name);
        System.out.println(Id);
       System.out.println("参数:"+Name);
        System.out.println("hello");
        System.out.println(sex);
       System.out.println(open);
        return "computer/list_computer";
   }


}
