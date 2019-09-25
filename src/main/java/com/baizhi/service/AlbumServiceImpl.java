package com.baizhi.service;

import com.baizhi.code.UUIDUtil;
import com.baizhi.dao.AlbumDao;
import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Album;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.security.auth.login.LoginException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


//专辑
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)//添加查询事务
public class AlbumServiceImpl implements AlbumService{
    //引入Dao层依赖
    @Resource
    private AlbumDao albumDao;

    @Resource
    private ChapterDao chapterDao;
    //分页查询所有的专辑
    @Override
    public HashMap<String,Object> selectAlbum(Integer page,Integer rows) {
        HashMap<String,Object> hashMap = new HashMap<>();
        //添加专辑数量
        Integer integer = albumDao.AlbumNumber();
        hashMap.put("records",integer);

        //添加总页数
        Integer sum = integer%rows ==0 ? integer/rows : integer/rows+1;
        hashMap.put("total",sum);

        //添加当前页
        hashMap.put("page",page);

        //添加数据
        List<Album> albums = albumDao.selectAlbum((page-1)*rows,rows);
        hashMap.put("rows",albums);
        return hashMap;
    }

    //添加一个专辑
    @Override
    @Transactional
    public String addAlbum(Album album) {
        String uuid = UUIDUtil.getUUID();

        //设置ID
        album.setId(uuid);

        //添加专辑的下的个数
        Integer integer = chapterDao.selectAllNumber(uuid);
        album.setCount(integer);

        //设置时间
        album.setCreaDate(new Date());

        albumDao.addAlbum(album);
        return uuid;
    }

    //修改一个专辑
    @Override
    @Transactional
    public String updateAlbum(Album album) {
        String id = album.getId();
        albumDao.updateAlbum(album);
        return id;
    }

    //删除一个专辑
    @Override
    @Transactional
    public String deleteAlbum(Album album, HttpSession session) {

        try {
            ServletContext servletContext = session.getServletContext();
            String realPath = servletContext.getRealPath("/AlbumImg");
            Album album2 = albumDao.seleteOneAlbum(album.getId());
            File file = new File(realPath, album2.getCover());
            //判断文件是否存在
            if (file.exists()) {
                //删除文件
                file.delete();
            }
            Integer integer = chapterDao.selectAllNumber(album.getId());
            if(integer != 0){
                throw new LoginException("专辑不为空");
            }
            albumDao.deleteAlbum(album.getId());

            return "删除成功";
        }catch (Exception e){
            e.printStackTrace();
            return "专辑不为空";
        }

    }

    @Override
    public Album seleteOneAlbum(String id) {

        Album album = albumDao.seleteOneAlbum(id);

        return album;
    }


}
