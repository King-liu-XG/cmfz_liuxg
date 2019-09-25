package com.baizhi.action;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("/AdminAction")
public class AdminAction {
    @Autowired
    private AdminService adminService;

    //后台管理员登入
    @RequestMapping("/selectOneAdmin")
    @ResponseBody
    public HashMap<String, Object> selectOneAdmin(Admin admin,String enCode,HttpServletRequest request)throws Exception{

        HashMap<String, Object> hashMap = adminService.selectAdmin(admin, enCode, request);

        return hashMap;
    }

}
