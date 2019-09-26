package com.baizhi;


import com.baizhi.dao.BannerDao;
import com.baizhi.dao.UserzDao;
import com.baizhi.entity.Banner;
import com.baizhi.entity.TestPoi;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestPoiz {
    @Resource
    private BannerDao bannerDao;

    @Resource
    private UserzDao userzDao;

    @Test
    public void test1() {
        TestPoi testPoi = new TestPoi();
        //创建一个Excel文档
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作蒲createSheet
        Sheet sheet = workbook.createSheet("用户信息");
        //创建一行
        Row row = sheet.createRow(0);
        //创建单元格
        Cell cell = row.createCell(0);
        //给单元格设置属性
        cell.setCellValue("内容");
        //导出单元格
        try {
            workbook.write(new FileOutputStream(new File("E://TestPoi.xls")));
            //释放资源
            workbook.close();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    @Test
    public void test2() {
        TestPoi testPoi1 = new TestPoi(1, "贱人", new Date());
        TestPoi testPoi2 = new TestPoi(1, "该死", new Date());
        TestPoi testPoi3 = new TestPoi(1, "去死", new Date());
        TestPoi testPoi4 = new TestPoi(1, "别活了", new Date());

        List<TestPoi> list = new ArrayList<>();
        list.add(testPoi1);
        list.add(testPoi2);
        list.add(testPoi3);
        list.add(testPoi4);
        //1先创建一个xls
        HSSFWorkbook sheets = new HSSFWorkbook();
        //创建一个工作溥
        Sheet sheet = sheets.createSheet("用户信息");

        //创建一行
        Row row0 = sheet.createRow(0);

        Cell cell1 = row0.createCell(0);
        //要合并的列      参数：行开始，行结束，列开时，列结束
        CellRangeAddress region = new CellRangeAddress(0, 0, 0, 2);
        sheet.addMergedRegion(region);

        //创建一个单元格
        cell1.setCellValue("学生表格");

        Row row1 = sheet.createRow(1);
        row1.createCell(0).setCellValue("id");
        row1.createCell(1).setCellValue("名字");
        row1.createCell(2).setCellValue("生日");

        //设置日期格式
        //创建日期对象
        CellStyle cellStyle = sheets.createCellStyle();

        //创建日期对象
        DataFormat dataFormat = sheets.createDataFormat();

        //设置日期格式
        cellStyle.setDataFormat(dataFormat.getFormat("yyyy-MM-dd"));

        for (int i = 0; i < list.size(); i++) {
            Row row2 = sheet.createRow(i + 1);
            row2.createCell(0).setCellValue(list.get(i).getId());
            row2.createCell(1).setCellValue(list.get(i).getName());
            Cell cell = row2.createCell(2);
            cell.setCellStyle(cellStyle);
            cell.setCellValue(list.get(i).getBirthday());
        }

        try {
            sheets.write(new FileOutputStream(new File("E://TestPoi.xls")));
            sheets.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


//    @Test
//    public void test3() {
//        try {
////设置超时时间-可自行调整
//            System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
//            System.setProperty("sun.net.client.defaultReadTimeout", "10000");
//            //初始化ascClient需要的几个参数
//            final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
//            final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
//            //替换成你的AK
//            final String accessKeyId = "LTAI4Fv12kexyDJTfZyfn7WY";//你的accessKeyId,参考本文档步骤2
//            final String accessKeySecret = "sRK1fFiIOFz8XREolZD9PdaiBXo3Im";//你的accessKeySecret，参考本文档步骤2
//            //初始化ascClient,暂时不支持多region（请勿修改）
//            IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,accessKeySecret);
//            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
//            IAcsClient acsClient = new DefaultAcsClient(profile);
//            //组装请求对象
//            SendSmsRequest request = new SendSmsRequest();
//            //使用post提交
//            request.setMethod(MethodType.POST);
//            //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式；发送国际/港澳台消息时，接收号码格式为国际区号+号码，如“85200000000”
//            request.setPhoneNumbers("13937820644");
//            //必填:短信签名-可在短信控制台中找到
//            request.setSignName("TomTiger");
//            //必填:短信模板-可在短信控制台中找到，发送国际/港澳台消息时，请使用国际/港澳台短信模版
//            request.setTemplateCode("SMS_174695077");
//            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
//            //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
//            request.setTemplateParam("{\"code\":\"8989\"}");
//            //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
//            //request.setSmsUpExtendCode("90997");
//            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
//            request.setOutId("yourOutId");
//            //请求失败这里会抛ClientException异常
//            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
//            if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
//
//                //请求成功
//
//
//            }
//            System.out.println( sendSmsResponse.getCode());
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//    }

    @Test
    public void test4(){
        Integer integer = bannerDao.BannerNumber();
        List<Banner> banners = bannerDao.selectBanner(0, integer,1);
        System.out.println(banners);
    }
}
