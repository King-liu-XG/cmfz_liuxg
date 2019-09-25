package com.baizhi.dao;

import com.baizhi.entity.Chapter;

import java.util.List;

public interface ChapterDao {
    //查询专辑下所有的的章节个数
    public Integer selectAllNumber(String id);

    //查询所有章节
    public List<Chapter> selectAllChapter(String id);

    //添加一个章节
    public void addOneChapter(Chapter chapter);

    //修改一个章节
    public void updateOneChapter(Chapter chapter);

    //删除一个章节
    public void delectOneChapter(String id);
}
