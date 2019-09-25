package com.baizhi.dao;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDao {

    //查询所有的文章
    public List<Article> selectAllArticle(@Param("page") Integer page,@Param("rows") Integer rows);

    //查询总条数
    public Integer sumNumber();

    //修改一个文章
    public void updateOneArticle(Article article);

    //删除文章
    public void delectOneArticle(String id);

    //添加一个文章
    public void addOneArticle(Article article);
}
