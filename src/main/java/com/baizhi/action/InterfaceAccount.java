package com.baizhi.action;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;

@RestController
@RequestMapping("/account")
public class InterfaceAccount {


    @RequestMapping("/login")
    public HashMap<String,Object> login(String phone){


        return null;
    }
}
