package com.fc.model;

import java.util.List;

public class Reply {

    private Integer rid;
    //回帖内容
    private String content;
    //两个外键，指向Post和User
    private Post post;
    private User user;

    //回复时间
    private String replyTime;

    //存储楼中楼的集合
    private List<Comment> commentList;

    public Reply() {}

    public Reply(Integer rid) {
        this.rid = rid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "rid=" + rid +
                ", content='" + content + '\'' +
                ", post=" + post +
                ", user=" + user +
                ", replyTime='" + replyTime + '\'' +
                ", commentList=" + commentList +
                '}';
    }
}
