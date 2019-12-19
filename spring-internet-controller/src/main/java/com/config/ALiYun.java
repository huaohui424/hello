package com.config;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

import java.util.Random;

public class ALiYun {
   /* public static String sendSms(String phoneNumber){
        //这里写自己的keyid
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "", "");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        //线路
        request.putQueryParameter("RegionId", "cn-hangzhou");
        //发短信给谁
        request.putQueryParameter("PhoneNumbers", phoneNumber);
        //签名名称，对应自己阿里云的签名
        request.putQueryParameter("SignName", "二学年项目");
        //短信模板编号，对应阿里云的短信模板
        request.putQueryParameter("TemplateCode", "SMS_179296279");
        //验证码
        String code = getVerification();
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");

        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return code;    //返回验证码
    }
    //生成6位随机数验证码
    public static String getVerification(){
        String code = String.valueOf((int)((Math.random()*9+1)*100000));
        return code;
    }
    public static void main(String[] args) {
        String code = SendSms.sendSms("17674711069");
        System.out.println(code);
    }*/
}
