package com.fc.util;


public class MyConstant {
    //七牛云相关
    public static final String QINIU_IMAGE_URL = "你的七牛云IMAGE_URL";
    public static final String QINIU_ACCESS_KEY = "你的七牛云ACCESS_KEY";
    public static final String QINIU_SECRET_KEY = "你的七牛云SECRET_KEY";
    public static final String QINIU_BUCKET_NAME = "你的七牛云BUCKET_NAME";

    //发送邮件的邮箱，要与df.properties中的一致
    public static final String MAIL_FROM = "fanchao100@yeah.net";

    //域名
    public static final String DOMAIN_NAME = "http://localhost:8080/df/";
    //public static final String DOMAIN_NAME = "http://www.doublefuck.top/";

    //三种操作
    public static final int OPERATION_CLICK_LIKE = 1;
    public static final int OPERATION_REPLY = 2;
    public static final int OPERATION_COMMENT = 3;

}
