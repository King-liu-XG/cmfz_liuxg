package com.baizhi.service;

import com.baizhi.entity.Userz;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

public interface UserzService {
    //查询所有用户
    public HashMap<String,Object> selectAllUserz(Integer page,Integer rows);

    //修改一个用户
    public HashMap<String,Object> updateOneUserz(Userz userz);

    //查询所有用户
    public List<Userz> selectUser(HttpServletRequest request);

    //
    public  HashMap<String,Object> registerUser();

    //集合
    //地图查询总用户
    public HashMap<String,Object> mapUser();
}
