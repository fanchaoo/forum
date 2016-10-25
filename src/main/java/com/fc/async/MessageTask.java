package com.fc.async;

import com.fc.mapper.MessageMapper;
import com.fc.mapper.PostMapper;
import com.fc.mapper.ReplyMapper;
import com.fc.mapper.UserMapper;
import com.fc.model.Message;
import com.fc.model.User;
import com.fc.util.MyConstant;

public class MessageTask implements Runnable {

    private MessageMapper messageMapper;
    private UserMapper userMapper;
    private PostMapper postMapper;
    private ReplyMapper replyMapper;
    private int pid;
    private int rid;
    private int sessionUid;
    private int operation;

    public MessageTask(MessageMapper messageMapper, UserMapper userMapper, PostMapper postMapper, ReplyMapper replyMapper, int pid, int rid, int sessionUid, int operation) {
        this.messageMapper = messageMapper;
        this.userMapper = userMapper;
        this.postMapper = postMapper;
        this.replyMapper = replyMapper;
        this.pid = pid;
        this.rid = rid;
        this.sessionUid = sessionUid;
        this.operation = operation;
    }

    @Override
    public void run() {
        //创建消息对象
        Message message = new Message();
        //设置是谁的消息
        int uid = postMapper.getUidByPid(pid);
        message.setUid(uid);

        //设置点赞人id和用户名
        User user = userMapper.selectUsernameByUid(sessionUid);
        message.setOtherId(user.getUid());
        message.setOtherUsername(user.getUsername());
        message.setPostId(pid);

        //设置操作和展示的内容
        if(operation== MyConstant.OPERATION_CLICK_LIKE){
            message.setOperation("赞了您的帖子");
            message.setDisplayedContent(postMapper.getTitleByPid(pid));
        }else if(operation==MyConstant.OPERATION_REPLY){
            message.setOperation("回复了您的帖子");
            message.setDisplayedContent(postMapper.getTitleByPid(pid));
        }else if(operation==MyConstant.OPERATION_COMMENT){
            message.setOperation("评论了你帖子的回复");
            String content = replyMapper.getContentByRid(rid);
            message.setDisplayedContent(content.substring(content.indexOf("<p>") + 3,content.indexOf("</p>")));
        }

        //向数据库插入一条消息
        messageMapper.insertMessage(message);
    }
}


