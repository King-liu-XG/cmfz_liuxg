package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chapter {  //章节
    private String id;  //id
    private String name;//名字
    private String url; //路径
    private String size;//大小
    private String duration;//时长
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date upDatez;//上传时间
    private String albumId;//专辑id
}
