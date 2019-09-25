package com.baizhi.action;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;

//文章
@RestController
@RequestMapping("/ArticleAction")
public class ArticleAction {

    //引入Service层
    @Autowired
    private ArticleService articleService;

    //查询所有的文章
    @RequestMapping("/selectAllArticle")
    public HashMap<String,Object> selectAllArticle(Integer page, Integer rows){
        HashMap<String,Object> hashMap = articleService.selectAllArticle(page,rows);
        return hashMap;
    }

    //修改一个文章
    @RequestMapping("/updateOneArticle")
    public HashMap<String, Object> updateOneArticle(Article article,MultipartFile coverPhoto, HttpServletRequest request) {

        System.out.println("修改"+article);
        HashMap<String, Object> hashMap = articleService.updateOneArticle(article);

        return hashMap;
    }


    //删除一个文章
    @RequestMapping("/delectOneArticle")
    public void delectOneArticle(Article article) {
        articleService.delectOneArticle(article.getId());
    }

    //, MultipartFile coverPhoto
    //添加文章
    @RequestMapping("/addOneArticle")
    public HashMap<String,Object> addOneArticle(Article article, MultipartFile coverPhoto, HttpServletRequest request){
        System.out.println("上传的文章"+article);
        HashMap<String,Object> hashMap = new HashMap<>();
        articleService.addOneArticle(article,coverPhoto,request);
        hashMap.put("ssd","dsa");
        return hashMap;
    }


    @RequestMapping("/updateOneArticless")
    public HashMap<String, Object> updateOneArticless(Article article,MultipartFile coverPhoto, HttpServletRequest request) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();


        try {
            if(coverPhoto.getSize()==0){
                articleService.updateOneArticle(article);
                hashMap.put("status", "200");
                hashMap.put("description", "修改成功");
            }else {
                Long time = new Date().getTime();
                //设置图片
                String realPath = request.getSession().getServletContext().getRealPath("/section/sectionImg");
                //判断是否存在
                File file = new File(realPath);
                if (!file.exists()) {
                    //不存在创建
                    file.mkdirs();
                }
                String[] split = coverPhoto.getOriginalFilename().split("\\.");
                String names = time.toString() + "." + split[1];

                coverPhoto.transferTo(new File(realPath, names));

                //添加图片的名字cover
                article.setCover(names);

                articleService.updateOneArticle(article);
                hashMap.put("status", "200");
                hashMap.put("description", "修改成功");
            }


        } catch (Exception e) {
            hashMap.put("status", "400");
            hashMap.put("description", "修改失败");
            e.printStackTrace();
        }
        return hashMap;


    }


}
