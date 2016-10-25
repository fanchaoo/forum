package com.fc.service;

import com.fc.async.MailTask;
import com.fc.mapper.MessageMapper;
import com.fc.mapper.UserMapper;
import com.fc.model.Message;
import com.fc.model.User;
import com.fc.util.MyConstant;
import com.fc.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MessageService {

    @Autowired
    private MessageMapper messageMapper;

    //获得消息列表
    public Map<String, List<Message>> listMessageByUid(Integer sessionUid) {
        List<Message> messageList = messageMapper.listMessageByUid(sessionUid);
        Map<String, List<Message>> map = new HashMap<>();
        for(Message message : messageList){
            String time = MyUtil.formatDate(message.getMsgTime()).substring(0,11);
            if(map.get(time)==null){
                map.put(time,new LinkedList<Message>());
                map.get(time).add(message);
            }else{
                map.get(time).add(message);
            }
        }
        return map;
    }
}
