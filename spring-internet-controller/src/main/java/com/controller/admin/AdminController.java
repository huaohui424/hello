package com.controller.admin;

import com.entity.Admin;
import com.entity.Users;
import com.github.pagehelper.PageInfo;
import com.service.AdminServier;
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
public class AdminController {
    @Autowired
    private AdminServier adminServier;

    @RequestMapping("/listAdmin")
    public ModelAndView listUsers(@RequestParam(value = "pageNum",defaultValue = "1",required = false) int pageNum,
                                  @RequestParam(value = "pageSize",defaultValue = "11",required = false)int pageSize){
        ModelAndView view = new ModelAndView();
        List<Admin> result= adminServier.getAllAdmin(pageNum,pageSize);
        PageInfo<Admin> pageInfo = new PageInfo<>(result,2);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("admin/list_admin");
        return view;
    }

    @RequestMapping("/insertAdmin")
    public String insert(){
        return "admin/insert_admin";
    }

    @RequestMapping("/insertAdminDo")
    public String insertComputer(MultipartFile myfile, String adminUsername, String adminPassword, String adminName, String adminSex,
                                 Integer adminAge, String adminIdCard, String adminAddress, String adminPhone, String adminNation, String adminRemark, String adminEnabled){
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
        System.out.println("filename"+filename);
        System.out.println(adminUsername);

        Admin admin = new Admin();
        admin.setAdminUsername(adminUsername);
        admin.setAdminPassword(adminPassword);
        admin.setAdminName(adminName);
        admin.setAdminSex(adminSex);
        admin.setAdminAge(adminAge);
        admin.setAdminIdCard(adminIdCard);
        admin.setAdminAddress(adminAddress);
        admin.setAdminPhone(adminPhone);
        admin.setAdminNation(adminNation);
        admin.setAdminRemark(adminRemark);
        admin.setAdminEnabled(adminEnabled);
        admin.setAdminImage(filename);
        adminServier.insertAdmin(admin);


        return "forward:listAdmin";
    }

    @RequestMapping("/updateAdmin")
    public ModelAndView update(Integer adminId){
        ModelAndView view = new ModelAndView();
        Admin admin = adminServier.getById(adminId);
        view.addObject("admin",admin);
        view.setViewName("admin/update_admin");
        return view;
    }

    @RequestMapping("/amendAdmin")
    public String updateDo(Integer adminId,String adminUsername,String adminPassword,String adminName,String adminSex,
                           Integer adminAge,String adminIdCard,String adminAddress,String adminPhone,String adminNation,String adminRemark,String adminEnabled){
        Admin admin = new Admin();
        System.out.println("李四在吗？？？"+adminName);
        System.out.println("年龄；"+adminAge);
        admin.setAdminId(adminId);
        admin.setAdminUsername(adminUsername);
        admin.setAdminPassword(adminPassword);
        admin.setAdminName(adminName);
        admin.setAdminSex(adminSex);
        admin.setAdminAge(adminAge);
        admin.setAdminIdCard(adminIdCard);
        admin.setAdminAddress(adminAddress);
        admin.setAdminPhone(adminPhone);
        admin.setAdminNation(adminNation);
        admin.setAdminRemark(adminRemark);
        admin.setAdminEnabled(adminEnabled);
        adminServier.updateAdmin(admin);
        return "forward:listAdmin";
    }

    @RequestMapping("/deleteAdmin")
    public String deleteUsers(Integer adminId){
        adminServier.delete(adminId);
        return "forward:listAdmin";
    }
}
