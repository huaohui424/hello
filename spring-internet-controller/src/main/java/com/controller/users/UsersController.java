package com.controller.users;

import com.entity.Users;
import com.github.pagehelper.PageInfo;
import com.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;

    @RequestMapping("/listUsers")
    public ModelAndView listUsers( @RequestParam(value = "pageNum",defaultValue = "1",required = false) int pageNum,
                                   @RequestParam(value = "pageSize",defaultValue = "11",required = false)int pageSize){
        ModelAndView view = new ModelAndView();
        List<Users> result= usersService.getAllUser(pageNum,pageSize);
        PageInfo<Users> pageInfo = new PageInfo<>(result,2);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("users/list_users");
        return view;
    }

    @RequestMapping("/insertUser")
    public String insert(){
        return "users/insert_users";
    }

    @RequestMapping("/insertUsersDo")
    public String insertComputer(String usersName,String usersCall ,String usersAddress,String usersIdCard,String usersPassword,String usersSex,Integer usersAge,String usersMenBer){
        Users users = new Users();
        users.setUsersName(usersName);
        users.setUsersCall(usersCall);
        users.setUsersAddress(usersAddress);
        users.setUsersIdCard(usersIdCard);
        users.setUsersPassword(usersPassword);
        users.setUsersSex(usersSex);
        users.setUsersAge(usersAge);
        users.setUsersMenBer(usersMenBer);
        usersService.insertUser(users);

        return "forward:listUsers";
    }

    @RequestMapping("/updateUsers")
    public ModelAndView update(Integer usersId){
        ModelAndView view = new ModelAndView();
        Users users = usersService.getById(usersId);
        view.addObject("users",users);
        view.setViewName("users/update_users");
        return view;
    }

    @RequestMapping("/amendUsers")
    public String updateDo(Integer usersId,String usersName,String usersCall,String usersAddress,String usersIdCard,String usersPassword,String usersSex,Integer usersAge,String usersMenBer,Double usersBalance){
        Users users = new Users();
        users.setUsersId(usersId);
        users.setUsersName(usersName);
        users.setUsersCall(usersCall);
        users.setUsersAddress(usersAddress);
        users.setUsersIdCard(usersIdCard);
        users.setUsersPassword(usersPassword);
        users.setUsersSex(usersSex);
        users.setUsersAge(usersAge);
        users.setUsersMenBer(usersMenBer);
        users.setUsersBalance(usersBalance);
        usersService.updateUser(users);
        return "forward:listUsers";
    }

    @RequestMapping("/deleteUsers")
    public String deleteUsers(Integer usersId){
        usersService.delete(usersId);
        return "forward:listUsers";
    }
}
