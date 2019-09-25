package com.baizhi.action;

import com.baizhi.dao.ArticleDao;
import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Album;
import com.baizhi.entity.Article;
import com.baizhi.entity.Banner;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping
public class InterfaceWith {

    //轮播图
    @Resource
    private BannerDao bannerDao;

    @Resource
    private ArticleDao articleDao;

    //文章
    @Autowired
    private ArticleService articleService;
    //专辑
    @Autowired
    private AlbumService albumService;
    @RequestMapping("/first_page")
    public HashMap<String,Object> firstPage(String uid,String type,String sub_type){
        HashMap<String,Object> hashMap = new HashMap<>();

        System.out.println(uid);

        if(uid != null){
            //首页展示数据
            //请求数据类型（首页：all，闻：wen，思：si）
            if(type.equals("all")){
                //首页数据
                //1.轮播图
                Integer integer = bannerDao.BannerNumber();

                List<Banner> banners = bannerDao.selectBanner(0, integer,1);
                if(banners.size()>5){
                    for (int i = 5; i < banners.size(); i++) {
                        banners.remove(i);
                    }
                }
                hashMap.put("header",banners);

                //专辑
                HashMap<String, Object> hashMap1 = albumService.selectAlbum(1, 6);
                List<Album> rows = (List<Album>)hashMap1.get("rows");
                hashMap.put("album",rows);

                //文章
                HashMap<String, Object> hashMap2 = articleService.selectAllArticle(1, 2);
                List<Article> rows1 =(List<Article>)hashMap2.get("rows");
                hashMap.put("artical",rows1);

            }
            if(type.equals("wen")){
                //专辑数据
                HashMap<String, Object> hashMap1 = albumService.selectAlbum(1, 6);
                List<Album> rows = (List<Album>)hashMap1.get("rows");
                hashMap.put("album",rows);
            }
            if(type.equals("si")){
                //选填（当type为si的时候传入）
                if(sub_type.equals("ssyj")){
                    //所有上师的文章
                    Integer integer = articleDao.sumNumber();
                    HashMap<String, Object> hashMap2 = articleService.selectAllArticle(1, integer);
                    List<Article> rows1 =(List<Article>)hashMap2.get("rows");
                    hashMap.put("artical",rows1);
                }

                if(sub_type.equals("xmfy")){
                    //所有上师的文章
                    Integer integer = articleDao.sumNumber();
                    HashMap<String, Object> hashMap2 = articleService.selectAllArticle(1, integer);
                    List<Article> rows1 =(List<Article>)hashMap2.get("rows");
                    hashMap.put("artical",rows1);

                }
            }

        }else {
            hashMap.put("","");
        }

        return hashMap;
    }

}
