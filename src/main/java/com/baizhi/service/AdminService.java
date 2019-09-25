package com.baizhi.service;

import com.baizhi.entity.Admin;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface AdminService {
    //登入
    public HashMap<String,Object> selectAdmin(Admin admin, String enCode, HttpServletRequest request);

}
