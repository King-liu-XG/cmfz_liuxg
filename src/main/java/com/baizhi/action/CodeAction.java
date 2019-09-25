package com.baizhi.action;

import com.baizhi.code.ImageCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("/CodeAction")
public class CodeAction {

    @RequestMapping("/codeImg")
    public void codeImg(HttpServletRequest request, HttpServletResponse response){
        //1.获取验证码随机数
        String securityCode = ImageCodeUtil.getSecurityCode();

        //2.将验证码随机数存入Session中
        request.getSession().setAttribute("code",securityCode);

        //3.将验证码字符生成图片
        BufferedImage image = ImageCodeUtil.createImage(securityCode);

        //4.设置响应格式
        response.setContentType("image/png");

        //5.将图片相应到页面
        try {
            ImageIO.write(image,"png",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
