package com.baizhi.action;

import com.baizhi.code.UUIDUtil;
import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.apache.commons.io.FileUtils; //FileUtils
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ws.schild.jave.MultimediaInfo;
import ws.schild.jave.MultimediaObject;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/ChapterAction")
public class ChapterAction {
    @Autowired
    private ChapterService chapterService;

    //查询专辑下所有章节
    @RequestMapping("/selectAllChapter")
    public List<Chapter> selectAllChapter(String id) {
        List<Chapter> chapters = chapterService.selectAllChapter(id);
        return chapters;
    }

    //添加一个章节
    @RequestMapping("/addOneChapter")
    public String addOneChapter(Chapter chapter, String albumId, String oper) {
        String ids = null;
        if (oper.equals("add")) {
            ids = chapterService.addOneChapter(chapter, albumId);
        }
        return ids;
    }

    @RequestMapping("/updateOneChapter")
    public void updateOneChapter(String id, MultipartFile url, HttpSession session) {
        Chapter chapter = new Chapter();
        chapter.setId(id);

        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/ChapterMp3");
        File file2 = new File(realPath);
        if (!file2.exists()) {
            file2.mkdir();
        }
        String[] filename = url.getOriginalFilename().split("\\.");
        String uuid = UUIDUtil.getUUID();

        //添加路径
        String uuidFile = uuid + "." + filename[1];
        try {
            url.transferTo(new File(realPath, uuidFile));
        } catch (IOException e) {
            e.printStackTrace();
        }
        chapter.setUrl(uuidFile);


        //获取文件的大小
        File file1 = new File(realPath, uuidFile);
        Long daxiao = null;
        if (file1.exists()) {
            daxiao = file1.length();
        }

        long kb = 1024;
        long mb = kb * 1024;
        long gb = mb * 1024;
        //String max = null;
        if (daxiao >= gb) {
            // max = ((float)daxiao / kb )+"GB";
            chapter.setSize(String.format("%.1f GB", (float) daxiao / gb));

        } else if (daxiao >= mb) {
            float f = (float) daxiao / mb;
            chapter.setSize(String.format(f > 100 ? "%.2f MB" : "%.2f MB", f));

        } else if (daxiao >= kb) {
            float f = (float) daxiao / kb;
            chapter.setSize(String.format(f > 100 ? "%.2f KB" : "%.2f KB", f));

        } else {
            chapter.setSize(String.format("%d B", daxiao));

        }

        //获取时间长
        File source = new File(realPath, uuidFile);
        Long ls = null;
        String format = null;
        try {
            MultimediaObject instance = new MultimediaObject(source);
            MultimediaInfo result = instance.getInfo();
            ls = result.getDuration(); // 1000;
            if (ls > 3600000) {
                format = new SimpleDateFormat("hh:mm:ss").format(ls);
            }
            if (ls < 3600000) {
                format = new SimpleDateFormat("mm:ss").format(ls);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        chapter.setDuration(format);

        chapterService.updateOneChapter(chapter);
    }

    //文件下载
    @RequestMapping("/download")
    public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String realPath = request.getRealPath("/ChapterMp3");
        FileInputStream fileInputStream = new FileInputStream(new File(realPath, fileName));
        ServletOutputStream os = response.getOutputStream();

        //设置响应格式 响应头，文件名    //attachment以附件形式下载  inline在线打开
        response.setHeader("content-disposition","attachment;fileName" + URLEncoder.encode(fileName, "UTF-8"));

        //文件下载
        IOUtils.copy(fileInputStream,os);

        //关流
        IOUtils.closeQuietly(fileInputStream);
        IOUtils.closeQuietly(os);

    }


}
