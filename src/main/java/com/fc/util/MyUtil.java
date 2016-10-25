package com.fc.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class MyUtil {

    public static String formatDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
        return sdf.format(date);
    }

    public static String createActivateCode(){
        return new Date().getTime() + UUID.randomUUID().toString().replace("-","");
    }

    public static void main(String[] args) {
        System.out.println(createActivateCode().length());
    }
}
