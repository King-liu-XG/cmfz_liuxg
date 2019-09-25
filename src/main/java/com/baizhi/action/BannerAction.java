package com.baizhi.action;

import com.baizhi.code.UUIDUtil;
import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

//轮播图
@RestController
@RequestMapping("/BannerAction")
public class BannerAction {

    //引入Service层
    @Autowired
    private BannerService bannerService;

    //查询所有轮播图
    @RequestMapping("/selectBanner")
    @ResponseBody                    //当前页      //每页展示条数
    public HashMap<String, Object> selectBanner(Integer page, Integer rows) throws Exception {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap = bannerService.selectBanner(page, rows,null);
        return hashMap;
    }

    //增删改操作
    @RequestMapping("/operation")
    public String operation(Banner banner,String oper,HttpServletRequest request, HttpServletResponse
            response) throws Exception {
        String uuid = null;
        //添加操作
        if (oper.equals("add")) {
            uuid = bannerService.addBanner(banner);
        }
        //删除操作
        if (oper.equals("del")) {
            bannerService.deleteBanner(banner,request,response);
        }

        //修改操作
        if (oper.equals("edit")) {

            System.out.println(banner.getPath() + "修改图片");
            uuid = bannerService.updateBanner(banner);

        }

        return uuid;
    }

    //文件上传
    @RequestMapping("/bannerUpload")
    public void bannerUpload(HttpServletRequest request, MultipartFile path, String id) {
        if (path.getSize() == 0) {
            System.out.println(path.getSize());
        } else {
            //通过相对路径获取绝对路径
            HttpSession session = request.getSession();
            ServletContext servletContext = session.getServletContext();
            String realPath = servletContext.getRealPath("/BannerImg");
            //获取文件夹
            File file = new File(realPath);
            //判断文件夹是否存在
            if (!file.exists()) {
                //不存在创建文件
                file.mkdir();
            }
            String uuid = UUIDUtil.getUUID();
            String[] split = path.getOriginalFilename().split("\\.");
            System.out.println(split[1]);
            String dd = uuid + "." + split[1];
            try {
                path.transferTo(new File(realPath, dd));
            } catch (IOException e) {
                e.printStackTrace();
            }
            Banner banner = new Banner();
            banner.setId(id);
            banner.setPath(dd);
            bannerService.updateBanner(banner);
        }


    }

    //修改状态
    @RequestMapping("/updateOne")
    @ResponseBody
    public HashMap<String,Object> updateOne(Banner banner){
        HashMap<String, Object> hashMap = bannerService.updateOneBanner(banner);
        return hashMap;
    }


}
