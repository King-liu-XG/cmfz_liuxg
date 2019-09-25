package com.baizhi.action;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@RestController
@RequestMapping("/Editor")
public class Editor {

    @RequestMapping("/uploadImg")
    public HashMap<String,Object> uploadImg(MultipartFile imgFile, HttpServletRequest request){
        HashMap<String,Object> hashMap = new HashMap<>();
        try{
            String realPath = request.getSession().getServletContext().getRealPath("/editor/EditorImg");
            File file = new File(realPath);
            //没有创建一个
            if(!file.exists()){
                file.mkdirs();
            }
            long time = new Date().getTime();

            String[] split = imgFile.getOriginalFilename().split("\\.");

            String imgname = time+"."+split[1];

            imgFile.transferTo(new File(realPath,imgname));


            //拼接 http://localhost:8989/cmfzLiuxg/editor/EditorImg/

            //1.获取http
            String http = request.getScheme();

            //获取ip地址
            String ip = request.getServerName();

            //获取端口号
            int port = request.getServerPort();

            //获取项目名 /contextPath自带/
            String contextPath = request.getContextPath();

            String https = http+"://"+ip+":"+port+contextPath+"/editor/EditorImg/"+imgname;

            //成功时
            hashMap.put("error",0);
            hashMap.put("url",https);
        }catch (Exception e){
            //失败时
            hashMap.put("error",1);
            hashMap.put("message","错误信息");
        }
        return hashMap;
    }

    //返回远程图片
    @RequestMapping("/returnPhoto")
    public HashMap<String,Object> returnPhoto(HttpServletRequest request){
        HashMap<String,Object> hashMaps = new HashMap<>();

        ArrayList<Object> list = new ArrayList<>();

        //获取图片的路径
        String realPath = request.getSession().getServletContext().getRealPath("/editor/EditorImg");

        //获取文件
        File file = new File(realPath);
        String[] list1 = file.list();
        for (String name : list1) {
            HashMap<String,Object> map = new HashMap<>();
            File f = new File(realPath,name); //f:\1.txt
            Boolean boo1 = null; //判断是否是文件
            Boolean boo2 = null; //判断是否有文件
            if(f.isDirectory()){
                boo1 = true; //是文件返回true;
                System.out.println("路径是目录");//如果是文件夹(Midir)
                //再判断是否有文件
                if(f.list().length > 0){
                    boo2 = true; //有文件返回true
                }else {
                    boo2 = false;//没有文件返回false
                }

            } else{
                boo1 = false; //不是文件返回false
                boo2 = false;
                System.out.println("路径不是目录"); //不是文件夹
            }
            map.put("is_dir",boo1); //是否是文件
            map.put("has_file",boo2); //是否有文件
            System.out.println("是否是文件++"+boo1);
            System.out.println("是否有文件++"+boo2);

            Long l = f.length();
            map.put("filesize",l); //文件的大小
            map.put("dir_path","");

            Boolean boo3 = null;
            try {
                Image image = ImageIO.read(f);
                boo3 = true;
            } catch(IOException ex) {
                boo3 =  false;
            }
            map.put("is_photo",boo3); //是否是图片
            System.out.println("是否是图片++"+boo3);

            String extension = FilenameUtils.getExtension(name);
            map.put("filetype",extension); //文件的类型
            System.out.println("文件的类型"+extension);

            map.put("filename",name); //文件的名字
            System.out.println("文件的名字"+name);

            //获取时间
            String[] split = name.split("\\.");
            long l1 = Long.parseLong(split[0]);
            String format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(l1);
            map.put("datetime",format);//文件上传的时间

            //添加到集合
            list.add(map);
        }

        //1.获取http
        String http = request.getScheme();

        //获取ip地址
        String ip = request.getServerName();

        //获取端口号
        int port = request.getServerPort();

        //获取项目名 /contextPath自带/
        String contextPath = request.getContextPath();

        String https = http+"://"+ip+":"+port+contextPath+"/editor/EditorImg/";
        hashMaps.put("current_url",https);//网络路径

        hashMaps.put("total_count",list.size());//文件的个数

        hashMaps.put("file_list",list);

        System.out.println("返回的集合"+hashMaps);


        return hashMaps;
    }

}
