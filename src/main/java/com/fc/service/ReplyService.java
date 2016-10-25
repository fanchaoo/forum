package com.fc.service;

import com.fc.async.MessageTask;
import com.fc.mapper.MessageMapper;
import com.fc.mapper.PostMapper;
import com.fc.mapper.ReplyMapper;
import com.fc.mapper.UserMapper;
import com.fc.model.*;
import com.fc.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private TaskExecutor taskExecutor;

    //回复
    public void reply(int sessionUid, int pid, String content) {
        //构造Reply对象
        User user = new User(sessionUid);
        Post post = new Post(pid);
        Reply reply =new Reply();
        reply.setUser(user);
        reply.setPost(post);
        reply.setContent(content);
        //向reply表插入一条记录
        replyMapper.insertReply(reply);
        //更新帖子的回复数
        postMapper.updateReplyCount(pid);
        //更新最后回复时间
        postMapper.updateReplyTime(pid);
        //插入一条回复消息
        taskExecutor.execute(new MessageTask(messageMapper,userMapper,postMapper,replyMapper,pid,0,sessionUid, MyConstant.OPERATION_REPLY));

    }

    //评论
    public void comment(int pid,int sessionUid, int rid, String content) {
        //构造Comment
        User user = new User(sessionUid);
        Reply reply = new Reply(rid);
        Comment comment = new Comment();
        comment.setUser(user);
        comment.setReply(reply);
        comment.setContent(content);
        //插入一条评论
        replyMapper.insertComment(comment);
        //更新最后回复时间
        postMapper.updateReplyTime(pid);
        //插入一条评论消息
        taskExecutor.execute(new MessageTask(messageMapper,userMapper,postMapper,replyMapper,pid,rid,sessionUid, MyConstant.OPERATION_COMMENT));

    }

    //根据pid列出回复
    public List<Reply> listReply(int pid) {
        //列出回复
        List<Reply> replyList = replyMapper.listReply(pid);
        for(Reply reply : replyList){
            //列出每条回复下的评论
            List<Comment> commentList = replyMapper.listComment(reply.getRid());
            reply.setCommentList(commentList);
        }
        return replyList;
    }
}

