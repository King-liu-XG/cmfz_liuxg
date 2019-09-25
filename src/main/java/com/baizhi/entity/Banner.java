package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Banner {

    private String id;//id
    private String name;//明子
    private String path;//路径
    private Integer status;//状态
    @JsonFormat(pattern = "yyyy-MM-dd")//响应格式
    private Date uploadingDate;//时间
    private String describez;//描述
}
