package com.fc.mapper;

import com.fc.model.Post;
import com.fc.model.Topic;

import java.util.List;


public interface TopicMapper {

    List<Topic> listTopic();

    List<String> listImage();

}
