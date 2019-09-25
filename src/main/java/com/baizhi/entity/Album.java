package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

//专辑
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Album { //专辑
    private String id;//id
    private String title;//标题
    private String cover;//封面
    private String author;//作者
    private String score;//平分
    private String broadcast;//播音
    private Integer count;//集数
    private String content;//内容
    @JsonFormat(pattern = "yyyy-MM-dd")//时间响应格式
    private Date creaDate;//发布时间
}
