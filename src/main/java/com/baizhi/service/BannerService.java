package com.baizhi.service;

import com.baizhi.entity.Banner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;


public interface BannerService {


    //查询所有的轮播图
    public HashMap<String, Object> selectBanner(Integer page,Integer rows,Integer status);

    //查询总个数
    public Integer BannerNumber();

    //添加
    public String addBanner(Banner banner);

    //修改
    public String updateBanner(Banner banner);

    //删除
    public void deleteBanner(Banner banner, HttpServletRequest request, HttpServletResponse
            response);


    //修改状态
    public HashMap<String,Object> updateOneBanner(Banner banner);
}
