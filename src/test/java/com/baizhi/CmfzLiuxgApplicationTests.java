package com.baizhi;

import com.baizhi.dao.AdminDao;
import com.baizhi.dao.BannerDao;
import com.baizhi.dao.UserzDao;
import com.baizhi.entity.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CmfzLiuxgApplicationTests {

    @Resource
    private AdminDao adminDao;

    @Resource
    private BannerDao bannerDao;

    @Resource
    private UserzDao userzDao;

    @Test
    public void contextLoads() {
        Admin admin = adminDao.selectAdmin("1231weq312312");
        System.out.println(admin);
    }

    @Test
    public void test1(){
        List<Banner> banners = bannerDao.selectBanner(0,2,null);
        System.out.println(banners);
    }

    @Test
    public void test2(){
        Integer integer = bannerDao.BannerNumber();
        System.out.println(integer);
    }





}
