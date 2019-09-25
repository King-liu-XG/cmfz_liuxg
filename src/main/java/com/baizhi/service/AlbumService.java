package com.baizhi.service;

import com.baizhi.entity.Album;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

public interface AlbumService {
    //分页查询所有的专辑
    public HashMap<String,Object> selectAlbum(Integer page, Integer rows);

    //添加
    public String addAlbum(Album album);

    //修改
    public String updateAlbum(Album album);

    //删除
    public String deleteAlbum(Album album, HttpSession session);

    //根据id查询一个
    public Album seleteOneAlbum(String id);
}
