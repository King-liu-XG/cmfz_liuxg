package com.baizhi.action;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/detail")
public class InterfaceDetail {

    //专辑
    @Autowired
    private AlbumService albumService;

    //歌集
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/wen")
    public HashMap<String,Object> wen(String id,String uid){
        HashMap<String,Object> hashMap = new HashMap<>();
        if(uid != null){
            Album album = albumService.seleteOneAlbum(id);
            hashMap.put("introduction",album);
            List<Chapter> chapters = chapterService.selectAllChapter(album.getId());
            hashMap.put("list",chapters);
        }
        return hashMap;
    }
}
