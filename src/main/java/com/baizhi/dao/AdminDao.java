package com.baizhi.dao;

import com.baizhi.entity.Admin;

public interface AdminDao {

    //登入
    public Admin selectAdmin(String username);

}
