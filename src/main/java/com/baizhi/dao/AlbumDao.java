package com.baizhi.dao;

import com.baizhi.entity.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumDao {
    //查询所有的专辑
    public List<Album>  selectAlbum(@Param("page")Integer page,@Param("rows")Integer rows);

    //查询专辑总数量
    public Integer AlbumNumber();

    //添加
    public void addAlbum(Album album);

    //修改
    public void updateAlbum(Album album);

    //删除
    public void deleteAlbum(String id);

    //根据id查询一个
    public Album seleteOneAlbum(String id);
}
