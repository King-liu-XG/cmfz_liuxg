package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article { //文章实体类
    private String id;//id
    private String title;//标题
    private String author;//作者
    private String content;//内容
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date creaDate;//发布时间
    private String guruId;//上师id;
    private String cover;//封面图片
    private String status;//状态


}
