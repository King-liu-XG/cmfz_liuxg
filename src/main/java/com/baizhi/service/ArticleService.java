package com.baizhi.service;

import com.baizhi.entity.Article;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

//文章的接口
public interface ArticleService {

    //查询所有的文章
    public HashMap<String,Object> selectAllArticle(Integer page, Integer rows);

    //修改一个文章的状态
    public HashMap<String, Object> updateOneArticle(Article article,MultipartFile coverPhoto, HttpServletRequest request);

    //删除文章
    public void delectOneArticle(String id);

    //添加一个文章
    public void addOneArticle(Article article, MultipartFile coverPhoto, HttpServletRequest request);
}
