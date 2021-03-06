package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
/*
*管理员实体类
*/

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class Admin implements Serializable {
    private Integer id;//
    private String username;//账号
    private String password;//密码
}
