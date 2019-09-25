package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TestPoi {
    private Integer id;
    private String name;
    private Date birthday;


}
