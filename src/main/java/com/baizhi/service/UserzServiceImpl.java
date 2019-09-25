package com.baizhi.service;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baizhi.dao.UserzDao;
import com.baizhi.entity.Register;
import com.baizhi.entity.UserMap;
import com.baizhi.entity.Userz;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)//查询的事务
public class UserzServiceImpl implements UserzService {

    //引入UserzDao
    @Resource
    private UserzDao userzDao;

    //查询所有的用户
    @Override
    public HashMap<String, Object> selectAllUserz(Integer page, Integer rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //添加当前页
        hashMap.put("page", page);

        //添加总条数
        Integer integer = userzDao.sumUser();
        System.out.println("用户总条数" + integer);

        //       records
        hashMap.put("records", integer);

        //添加总页数
        //Integer sumPage = integer%rows == 0 ? integer/rows : integer/rows+1;
        Integer sumPage = integer % rows == 0 ? integer / rows : integer / rows + 1;
        System.out.println("用户总页数" + sumPage);
        hashMap.put("total", sumPage);

        //添加信息
        List<Userz> userzDaos = userzDao.selectAllUserz((page - 1) * rows, rows);
        hashMap.put("rows", userzDaos);

        return hashMap;
    }

    //有修改用户的状态
    @Override
    @Transactional
    public HashMap<String, Object> updateOneUserz(Userz userz) {
        HashMap<String, Object> hashMap = new HashMap<>();
        try {
            userzDao.updateOneUserz(userz);
            hashMap.put("status", "200");
            hashMap.put("description", "修改成功");
        } catch (Exception e) {
            hashMap.put("status", "400");
            hashMap.put("description", "修改失败");
            e.printStackTrace();
        }
        return hashMap;
    }

    //导出用户
    @Override
    public List<Userz> selectUser(HttpServletRequest request) {
        List<Userz> userzs = userzDao.selectUser();

        String realPath = request.getSession().getServletContext().getRealPath("/user/UserImg");

        for (Userz userz : userzs) {
            userz.setAvatar(realPath + "/" + userz.getAvatar());
        }

        //参数：标题，表名，实体类类对象，导出的集合 new FileInputStream(new File("D:/TestEasyPoi.xls"))
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("计算机一班学生", "学生"), Userz.class, userzs);


        try {

            workbook.write(new FileOutputStream(new File("E:/UserPoi.xls")));

            workbook.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    //查询每月
    @Override
    public HashMap<String, Object> registerUser() {
        //Map集合
        HashMap<String, Object> hashMap = new HashMap<>();
        //List<Userz> userzs = userzDao.selectUser();
        //查询男
        List<Register> manList1 = userzDao.monthUser("男");
        //查询女
        List<Register> girlList2 = userzDao.monthUser("女");
        //展示月份
        List<String> list = new ArrayList<>();
        list.add("五月");
        list.add("六月");
        list.add("七月");
        list.add("八月");
        list.add("九月");
        list.add("十月");
        //男
        List<Integer> list2 = new ArrayList<>();
        list2.add(0);
        list2.add(0);
        list2.add(0);
        list2.add(0);
        list2.add(0);
        list2.add(0);
        //男月份
        for (Register register : manList1) {
            if (register.getMonths().equals("5月")) {
                list2.add(0, register.getCount());
            }
            if (register.getMonths().equals("6月")) {
                list2.add(1, register.getCount());
            }
            if (register.getMonths().equals("7月")) {
                list2.add(2, register.getCount());
            }
            if (register.getMonths().equals("8月")) {
                list2.add(3, register.getCount());
            }
            if (register.getMonths().equals("9月")) {
                list2.add(4, register.getCount());
            }
            if (register.getMonths().equals("10月")) {
                list2.add(5, register.getCount());
            }
        }

        System.out.println("男注册量" + list2);

        //女
        List<Integer> list3 = new ArrayList<>();
        list3.add(0);
        list3.add(0);
        list3.add(0);
        list3.add(0);
        list3.add(0);
        list3.add(0);

        //女
        for (Register register : girlList2) {
            if (register.getMonths().equals("5月")) {
                list3.add(0, register.getCount());
            }
            if (register.getMonths().equals("6月")) {
                list3.add(1, register.getCount());
            }
            if (register.getMonths().equals("7月")) {
                list3.add(2, register.getCount());
            }
            if (register.getMonths().equals("8月")) {
                list3.add(3, register.getCount());
            }
            if (register.getMonths().equals("9月")) {
                list3.add(4, register.getCount());
            }
            if (register.getMonths().equals("10月")) {
                list3.add(5, register.getCount());
            }
        }
        System.out.println("女注册量" + list3);
        hashMap.put("monthz", list);
        hashMap.put("boy", list2);
        hashMap.put("girl", list3);

        return hashMap;
    }

    //查询地图
    @Override
    public HashMap<String, Object> mapUser() {
        //男
        //List<UserMap> bayList = userzDao.mapUser("6月");
        //总
        HashMap<String, Object> hashMap = new HashMap<>();

        //集合月
        List<String> list = new ArrayList<>();
        list.add("五月");
        list.add("六月");
        list.add("七月");
        list.add("八月");
        list.add("九月");
        list.add("十月");
        hashMap.put("months", list);//months
        HashMap<String, Object> hashMap2 = new HashMap<>();

        hashMap2.put("Mayz", userzDao.mapUser("5月").getList());


        hashMap2.put("June", userzDao.mapUser("6月").getList());

        hashMap2.put("July", userzDao.mapUser("7月").getList());

        hashMap2.put("August", userzDao.mapUser("8月").getList());

        hashMap2.put("Sep", userzDao.mapUser("9月").getList());

        hashMap2.put("Oct", userzDao.mapUser("10月").getList());

        hashMap.put("listz", hashMap2);
        return hashMap;
    }


}
