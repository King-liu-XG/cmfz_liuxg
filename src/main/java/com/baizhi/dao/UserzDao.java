package com.baizhi.dao;


import com.baizhi.entity.Register;
import com.baizhi.entity.UserMap;
import com.baizhi.entity.Userz;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserzDao {
    //分页查询所有用户
    public List<Userz> selectAllUserz(@Param("page") Integer page,@Param("rows") Integer rows);


    //查询所有用户
    public List<Userz> selectUser();

    //修改一个用户
    public void updateOneUserz(Userz userz);

    //查询所有用户
    public Integer sumUser();

    //查询所有用户
    public List<Register> monthUser(String sex);

    //地图查询总用户
    public UserMap mapUser(String yue);
}
