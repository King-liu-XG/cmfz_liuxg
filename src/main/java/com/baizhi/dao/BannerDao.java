package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerDao {

    //查询所有的轮播图
    public List<Banner> selectBanner(@Param("page")Integer page,@Param("rows")Integer rows,@Param("status")Integer status);

    //查询总个数
    public Integer BannerNumber();

    //添加
    public void addBanner(Banner banner);

    //修改
    public void updateBanner(Banner banner);

    //删除
    public void deleteBanner(String id);

    //查询一个的轮播图
    public Banner selectOneBanner(String id);

}
