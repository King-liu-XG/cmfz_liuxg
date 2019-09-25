package com.baizhi.service;

import com.baizhi.entity.Chapter;

import java.util.List;

public interface ChapterService {
    //查询所有的章节
    //查询所有章节
    public List<Chapter> selectAllChapter(String id);

    //添加一个章节
    public String addOneChapter(Chapter chapter,String id);

    //修改一个章节
    public void updateOneChapter(Chapter chapter);

    //删除一个章节
    public void delectOneChapter(String id);
}
