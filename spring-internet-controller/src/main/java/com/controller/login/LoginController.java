package com.controller.login;

import com.config.SMSVerification;
import com.entity.Admin;
import com.entity.Users;
import com.service.AdminServier;
import com.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
@Controller()
public class LoginController {
    @Autowired
    private AdminServier adminServier;

    @RequestMapping("/adminLogin")
    public String login3333(){
        System.out.println("login登录页面----");
        return "/admin/login";
    }

    @RequestMapping("/show")
    public String show(){
        System.out.println("login登录页面----");
        return "/admin/index";
    }



    @RequestMapping("/login")
    public String login2(@Param("username") String username, @Param("password") String password, @Param("code") String code,Model model,HttpSession session){
        System.out.println("username"+username);
        System.out.println("password"+password);
        System.out.println("code"+code);
        Admin admin = adminServier.checkAdmin(username);
        System.out.println(admin.getAdminPassword());
        System.out.println("实体类"+admin.getAdminNation());
        if(username==null||"".equals(username)){  //没有输入姓名
            model.addAttribute("msg1","请输入姓名");
        }else if(username==null||"".trim().equals(admin)){ //输入姓名但是姓名错误
            model.addAttribute("msg1","账户不存在，请先注册");
            return "login";
        }else if(username!=null &(password==null||"".equals(password))){ //姓名正确，但没有输入密码
            model.addAttribute("msg2","请输入密码");
        }else if(username!=null &!(admin.getAdminPassword().equals(password))) { //姓名正确，输入密码，但是密码错误
            model.addAttribute("msg2","密码错误");

        }else if (admin!=null &admin.getAdminPassword().equals(password)){ //姓名密码均正确
            session.setAttribute("username",username);
            return "admin/index";
        }
        return "admin/login";
    }

    @RequestMapping("/loginout")
    public String loginOut(HttpSession session){
        session.setAttribute("username",null);
        return "admin/login";
    }

    /*@RequestMapping("/getVerification")
    public String
    */
    @RequestMapping("/SMSVerification")
    public String SMSVerifications(String phoneNumber){
        SMSVerification smsVerification = new SMSVerification();
        System.out.println("短信验证码："+smsVerification.sendMessage(phoneNumber));
        smsVerification.sendUtils(smsVerification.sendMessage(phoneNumber),smsVerification.getVerication());

        return "admin/index";
    }


}
