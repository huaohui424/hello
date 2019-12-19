package com.controller.upload;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class UploadController {

    public void upload(MultipartFile myfile){
        String directory = "D:\\packge\\spring-myinternet-bar\\spring-internet-controller\\web\\WEB-INF\\image";
        //得到上传过来的文件名
        String filename = myfile.getOriginalFilename();
        String path = directory + File.separator + filename;
        File file = new File(path);
        try {
            myfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
