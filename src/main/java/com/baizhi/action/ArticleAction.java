package com.baizhi.action;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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
        HashMap<String, Object> hashMap = articleService.updateOneArticle(article,coverPhoto,request);


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



}
