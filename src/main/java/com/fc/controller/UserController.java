package com.fc.controller;

import com.fc.model.Post;
import com.fc.model.User;
import com.fc.service.PostService;
import com.fc.service.QiniuService;
import com.fc.service.UserService;
import com.fc.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private QiniuService qiniuService;

    /**
     * 查看我的个人主页
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/toMyProfile.do")
    public String toMyProfile(HttpSession session,Model model) {
        int sessionUid = (int) session.getAttribute("uid");
        User user = userService.getProfile(sessionUid, sessionUid);
        List<Post> postList =  postService.getPostList(sessionUid);
        model.addAttribute("user",user);
        model.addAttribute("postList",postList);
        return "myProfile";
    }


    /**
     * 查看别人的主页
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("/toProfile.do")
    public String toProfile(int uid,Model model,HttpSession session) {
        //如果是自己的页面，直接跳转到本人个人主页
        int sessionUid = (int) session.getAttribute("uid");
        if(sessionUid==uid){
            return "redirect:toMyProfile.do";
        }
        //判断是否关注当前用户
        boolean following = userService.getFollowStatus(sessionUid,uid);
        //获得用户信息
        User user = userService.getProfile(sessionUid, uid);
        //获得发帖列表
        List<Post> postList =  postService.getPostList(uid);
        //向模型中添加数据
        model.addAttribute("following",following);
        model.addAttribute("user",user);
        model.addAttribute("postList",postList);
        return "profile";
    }


    /**
     * 去编辑信息的页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/toEditProfile.do")
    public String toEditProfile(HttpSession session,Model model){
        int uid = (int) session.getAttribute("uid");
        User user = userService.getEditInfo(uid);
        model.addAttribute("user",user);
        return "editProfile";
    }

    /**
     * 编辑信息
     * @param user
     * @return
     */
    @RequestMapping("/editProfile.do")
    public String editProfile(User user){
        System.out.println(user);
        userService.updateUser(user);
        return "redirect:toMyProfile.do";
    }


    @RequestMapping("/updatePassword.do")
    public String updatePassword(String password,String newpassword,String repassword,HttpSession session,Model model){
        int sessionUid = (int) session.getAttribute("uid");
        String status = userService.updatePassword(password,newpassword,repassword,sessionUid);
        if(status.equals("ok")){
            return "redirect:logout.do";
        }else {
            model.addAttribute("passwordError",status);
            return "editProfile";
        }
    }



    @RequestMapping("/forgetPassword.do")
    public @ResponseBody
    String forgetPassword(String email){
        userService.forgetPassword(email);
        return "";
    }


    @RequestMapping("/afterForgetPassword.do")
    public String afterForgetPassword(){
        return "prompt/afterForgetPassword";
    }


    @RequestMapping("/updateHeadUrl.do")
    public String updateHeadUrl(MultipartFile myFileName,Model model,HttpSession session) throws IOException {
        // 文件类型限制
        String[] allowedType = {"image/bmp", "image/gif", "image/jpeg", "image/png"};
        boolean allowed = Arrays.asList(allowedType).contains(myFileName.getContentType());
        if (!allowed) {
            model.addAttribute("error3","图片格式仅限bmp，jpg，png，gif~");
            return "editProfile";
        }
        // 图片大小限制
        if (myFileName.getSize() > 3 * 1024 * 1024) {
            model.addAttribute("error3","图片大小限制在3M以下哦~");
            return "editProfile";
        }
        // 包含原始文件名的字符串
        String fi = myFileName.getOriginalFilename();
        // 提取文件拓展名
        String fileNameExtension = fi.substring(fi.indexOf("."), fi.length());
        // 生成云端的真实文件名
        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;
        qiniuService.upload(myFileName.getBytes(), remoteFileName);

        //更新数据库中头像URL
        int uid = (int) session.getAttribute("uid");
        userService.updateHeadUrl(uid,MyConstant.QINIU_IMAGE_URL + remoteFileName);

        return "redirect:toMyProfile.do";
    }

    @RequestMapping("/follow.do")
    public String follow(int uid,HttpSession session){
        int sessionUid = (int) session.getAttribute("uid");
        userService.follow(sessionUid,uid);
        return "forward:toProfile.do";
    }

    @RequestMapping("/unfollow.do")
    public String unfollow(int uid,HttpSession session){
        int sessionUid = (int) session.getAttribute("uid");
        userService.unfollow(sessionUid,uid);
        return "forward:toProfile.do";
    }


    @RequestMapping("/verify.do")
    public String verify(String code){
        userService.verifyForgetPassword(code);
        return "redirect:toLogin.do";
    }
}

