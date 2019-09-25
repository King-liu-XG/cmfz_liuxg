package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

//文章
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)//查询所添加的事务
public class ArticleServiceImpl implements ArticleService {

    //引入ArticleDao
    @Resource
    private ArticleDao articleDao;

    //查询所有的文章
    @Override
    public HashMap<String, Object> selectAllArticle(Integer page, Integer rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //当前页
        hashMap.put("page", page);

        //总条数
        Integer integer = articleDao.sumNumber();
        hashMap.put("records", integer);//records

        //总页数
        Integer sumPage = integer % rows == 0 ? integer / rows : integer / rows + 1;
        hashMap.put("total", sumPage);


        List<Article> articles = articleDao.selectAllArticle((page - 1) * rows, rows);
        hashMap.put("rows", articles);
        return hashMap;
    }


    //修改一个文章的状态
    @Override
    @Transactional
    public HashMap<String, Object> updateOneArticle(Article article) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        try {
            articleDao.updateOneArticle(article);
            hashMap.put("status", "200");
            hashMap.put("description", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            hashMap.put("status", "400");
            hashMap.put("description", "修改失败");
        }


        return hashMap;


    }

    //删除
    @Override
    @Transactional
    public void delectOneArticle(String id) {
        articleDao.delectOneArticle(id);
    }

    //添加
    @Override
    @Transactional
    public void addOneArticle(Article article, MultipartFile coverPhoto, HttpServletRequest request) {
        try {
            //设置id
            Long time = new Date().getTime();
            article.setId(String.valueOf(time));

            //设置时间
            article.setCreaDate(new Date());

            //设置上师id
            article.setGuruId("1");

            //设置状态
            article.setStatus("1");

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

            articleDao.addOneArticle(article);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
