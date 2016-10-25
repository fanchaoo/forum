package com.fc.mapper;

import com.fc.model.Message;
import com.fc.model.Topic;

import java.util.List;


public interface MessageMapper {

    void insertMessage(Message message);

    List<Message> listMessageByUid(Integer uid);


}
