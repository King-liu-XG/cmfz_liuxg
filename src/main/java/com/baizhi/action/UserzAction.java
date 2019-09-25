package com.baizhi.action;

import com.alibaba.fastjson.JSONObject;
import com.baizhi.entity.Userz;
import com.baizhi.service.UserzService;
import io.goeasy.GoEasy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RestController
@RequestMapping("/UserzAction")
public class UserzAction {
    //引入UserzService
    @Autowired
    private UserzService userzService;

    //查询所有的用户
    @RequestMapping("/selectAllUserz")
    public HashMap<String,Object> selectAllUserz(Integer page,Integer rows) {
        HashMap<String, Object> hashMap = userzService.selectAllUserz(page, rows);
        return hashMap;
    }


    //修改用户的状态
    @RequestMapping("/updateOneUserz")
    public HashMap<String,Object> updateOneUserz(Userz userz) {
        HashMap<String, Object> hashMap = userzService.updateOneUserz(userz);

        return hashMap;
    }

    //导出应付Poi
    @RequestMapping("/exportUser")
    public void exportUser(HttpServletRequest request){
        userzService.selectUser(request);
    }

    //查询个月注册用户量
    @RequestMapping("/registerUser")
    public HashMap<String,Object> registerUser(){
        HashMap<String, Object> hashMap = userzService.registerUser();
        System.out.println("hahah");
        return hashMap;
    }

    @RequestMapping("/registerUserzz")
    public void registerUserzz(){
        HashMap<String, Object> hashMap = userzService.registerUser();

        // 参数：服务器地址    ,  AppKey:commonKey
        GoEasy goEasy = new GoEasy( "http://rest-hangzhou.goeasy.io", "BC-d9c93f073b14425c87d94b9ecc790efa");

        //String s1 = hashMap.toString();
//       jsonObject.put("data",hashMap);
        JSONObject jsonObject = new JSONObject(hashMap);

        System.out.println("打开页面时我已经打开");

        //String strJson = obj.toString();
        String s = jsonObject.toJSONString();

        //参数：管道标识，发送内容
        goEasy.publish("liuKing",s);

    }

    @RequestMapping("/mapUser")
    public HashMap<String, Object> mapUser() {

        HashMap<String, Object> hashMap = userzService.mapUser();
        System.out.println(hashMap);
        return hashMap;
    }

    @RequestMapping("/mapUserzz")
    public void mapUserzz() {
        HashMap<String, Object> hashMap = userzService.mapUser();

        // 参数：服务器地址    ,  AppKey:commonKey
        GoEasy goEasy = new GoEasy( "http://rest-hangzhou.goeasy.io", "BC-d9c93f073b14425c87d94b9ecc790efa");

        //String s1 = hashMap.toString();
//       jsonObject.put("data",hashMap);

        JSONObject jsonObject = new JSONObject(hashMap);

        System.out.println("打开页面时我已经打开");

        //String strJson = obj.toString();

        String s = jsonObject.toJSONString();

        System.out.println(s);

        //参数：管道标识，发送内容
        goEasy.publish("liuKings",s);

    }
}
