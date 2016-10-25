package com.fc.controller;

import com.fc.model.PageBean;
import com.fc.model.Post;
import com.fc.model.User;
import com.fc.service.PostService;
import com.fc.service.UserService;
import com.fc.util.MyConstant;
import com.fc.service.QiniuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private QiniuService qiniuService;

    /**
     * 去主页
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/toIndex.do")
    public String toIndex(Model model, HttpServletRequest request){
        System.out.println(request.getRemoteAddr());
        //记录访问信息
        userService.record(request.getRequestURL(),request.getContextPath(),request.getRemoteAddr());
        //列出帖子
        PageBean<Post> pageBean = postService.listPostByTime(1);
        //列出用户
        List<User> userList = userService.listUserByTime();
        //列出活跃用户
        List<User> hotUserList = userService.listUserByHot();
        //向模型中添加数据
        model.addAttribute("pageBean",pageBean);
        model.addAttribute("userList",userList);
        model.addAttribute("hotUserList",hotUserList);
        return "index";
    }


    //上传图片
    @RequestMapping(value = "/upload.do", method = {RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
    public
    @ResponseBody
    String upload(MultipartFile myFileName) throws IOException {

        // 文件类型限制
        String[] allowedType = {"image/bmp", "image/gif", "image/jpeg", "image/png"};
        boolean allowed = Arrays.asList(allowedType).contains(myFileName.getContentType());
        if (!allowed) {
            return "error|不支持的类型";
        }
        // 图片大小限制
        if (myFileName.getSize() > 3 * 1024 * 1024) {
            return "error|图片大小不能超过3M";
        }
        // 包含原始文件名的字符串
        String fi = myFileName.getOriginalFilename();
        // 提取文件拓展名
        String fileNameExtension = fi.substring(fi.indexOf("."), fi.length());
        // 生成云端的真实文件名
        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;

        qiniuService.upload(myFileName.getBytes(), remoteFileName);

        // 返回图片的URL地址
        return MyConstant.QINIU_IMAGE_URL + remoteFileName;
    }

}
