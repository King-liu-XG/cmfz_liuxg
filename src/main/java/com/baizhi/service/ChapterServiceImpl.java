package com.baizhi.service;

import com.baizhi.code.UUIDUtil;
import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Chapter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)//查询
public class ChapterServiceImpl implements ChapterService{
    //引入Dao依赖
    @Resource
    private ChapterDao chapterDao;

    //查询所有章节
    @Override
    public List<Chapter> selectAllChapter(String id) {
        List<Chapter> chapters = chapterDao.selectAllChapter(id);
        return chapters;
    }

    //添加一个章节
    @Override
    @Transactional
    public String addOneChapter(Chapter chapter,String id) {
        String uuid = UUIDUtil.getUUID();

        chapter.setId(uuid);//设置id

        chapter.setUpDatez(new Date());//上传时间

        System.out.println(id+"添加专辑的id");
        chapter.setAlbumId(id);//设置id

        chapterDao.addOneChapter(chapter);
        return uuid;
    }

    //修改一个章节
    @Override
    @Transactional
    public void updateOneChapter(Chapter chapter) {
        chapterDao.updateOneChapter(chapter);
    }

    //删除一个章节
    @Override
    @Transactional
    public void delectOneChapter(String id) {

    }
}
