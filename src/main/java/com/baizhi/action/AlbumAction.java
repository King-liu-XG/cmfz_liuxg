package com.baizhi.action;

import com.baizhi.code.UUIDUtil;
import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;


@RestController
@RequestMapping("/AlbumAction")
public class AlbumAction {
    @Autowired
    private AlbumService albumService;

    //分页查询所有的专辑
    @RequestMapping("/selectAlbum")
    public HashMap<String, Object> selectAlbum(Integer page, Integer rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap = albumService.selectAlbum(page, rows);
        return hashMap;
    }

    //增删改
    @RequestMapping("/addOneAlbum")
    public String addOneAlbum(Album album, String oper,HttpSession session) {

        String id = null;
        //添加
        if (oper.equals("add")) {
            id = albumService.addAlbum(album);

        }
        //删除
        if (oper.equals("del")) {
            id = albumService.deleteAlbum(album, session);
        }
        //修改
        if (oper.equals("edit")) {
            id = albumService.updateAlbum(album);
        }

        //System.out.println(id + "添加返回的id值");
        return id;
    }

    //修改文件
    @RequestMapping("/updatePaperss")
    public void updatePaper(MultipartFile cover, String id, HttpSession session) {
        if (cover.getSize() == 0) {

        } else {
            //相对路径获取绝对路径
            System.out.println("修改图片的历经++++++++++++++++++++++++++++");
            ServletContext servletContext = session.getServletContext();
            String realPath = servletContext.getRealPath("/AlbumImg");

            System.out.println("修改图片的历经++++++++++++++++++++++++++++");
            //获取文件夹
            File file1 = new File(realPath);

            //如果不存在创建文件夹
            if (!file1.exists()) {
                file1.mkdir();
            }

            String uuid = UUIDUtil.getUUID();
            String[] split = cover.getOriginalFilename().split("\\.");
            String ss = uuid + "." + split[1];

            try {
                cover.transferTo(new File(realPath, ss));
            } catch (IOException e) {
                e.printStackTrace();
            }

            Album album = new Album();
            album.setId(id);
            album.setCover(ss);
            albumService.updateAlbum(album);
        }
    }
}
