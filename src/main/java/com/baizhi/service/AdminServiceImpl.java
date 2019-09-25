package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class AdminServiceImpl implements AdminService{
    //注入Dao层
    @Resource
    private AdminDao adminDao;

    @Override
    public HashMap<String,Object> selectAdmin(Admin admin,String enCode, HttpServletRequest request) {
        Admin admins = adminDao.selectAdmin(admin.getUsername());
        HashMap<String, Object> hashMap = new HashMap<>();
        String code = (String) request.getSession().getAttribute("code");
        //判断验证码是否错误
        if(!code.equals(enCode)){
            hashMap.put("status","400");
            hashMap.put("reminder","验证码错误");
        }else {
            //判断账号是否错误
            if(admins == null){
                hashMap.put("status","400");
                hashMap.put("reminder","账号错误");
            }else {
                //判断密码是否错误
                if(!admins.getPassword().equals(admin.getPassword())){
                    hashMap.put("status","400");
                    hashMap.put("reminder","密码错误");
                }else {
                    hashMap.put("status","200");
                }
            }
        }
        return hashMap;
    }
}
