package com.baizhi.service;

import com.baizhi.code.UUIDUtil;
import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BannerServiceImpl implements BannerService {
    //引入Dao层
    @Resource
    private BannerDao bannerDao;

    //查询所有轮播图
    @Override
    public HashMap<String, Object> selectBanner(Integer page, Integer rows,Integer status) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        //总条数
        Integer integer = bannerDao.BannerNumber();
        //添加总条数
        hashMap.put("records", integer);

        //总页数 条件表达式？表达式1：表达式2。
        Integer total = integer % rows == 0 ? integer / rows : integer / rows + 1;
        //添加总页数
        hashMap.put("total", total);

        //当前页数
        hashMap.put("page", page);
        //分页所有字段
        Integer pagez = (page - 1) * rows;

        //添加数据
        List<Banner> banners = bannerDao.selectBanner(page, rows,null);
        hashMap.put("rows", banners);

        return hashMap;
    }

    //查询总条数
    @Override
    public Integer BannerNumber() {

        Integer integer = bannerDao.BannerNumber();

        return integer;
    }

    //添加
    @Override
    @Transactional
    public String addBanner(Banner banner) {
        //添加Id
        String uuid = UUIDUtil.getUUID();
        banner.setId(uuid);

        //设置状态码
        banner.setStatus(1);

        //设置上传时间
        banner.setUploadingDate(new Date());

        bannerDao.addBanner(banner);
        return uuid;
    }

    //修改
    @Override
    @Transactional
    public String updateBanner(Banner banner) {
        String id = banner.getId();
        bannerDao.updateBanner(banner);
        return id;
    }

    //删除
    @Override
    @Transactional
    public void deleteBanner(Banner banner, HttpServletRequest request, HttpServletResponse
            response) {
        //先获取文件名
        String realPath = request.getRealPath("/BannerImg");
        Banner banner1 = bannerDao.selectOneBanner(banner.getId());
        File file = new File(realPath, banner1.getPath());
        //判断文件是否存在
        if (file.exists()) {
            //删除文件
            file.delete();
        }
        bannerDao.deleteBanner(banner.getId());
    }

    //修改状态
    @Override
    @Transactional
    public HashMap<String, Object> updateOneBanner(Banner banner) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        try {
            bannerDao.updateBanner(banner);
            hashMap.put("status", "200");
            hashMap.put("description", "修改成功");
        } catch (Exception e) {
            hashMap.put("status", "400");
            hashMap.put("description", "修改失败");
            e.printStackTrace();
        }
        return hashMap;
    }
}
