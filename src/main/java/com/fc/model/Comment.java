package com.fc.model;


public class Comment {

    private Integer cid;

    //评论内容
    private String content;
    //两个外键，指向Reply和User
    private Reply reply;
    private User user;

    //评论时间
    private String commentTime;

    public Comment() {}

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", content='" + content + '\'' +
                ", reply=" + reply +
                ", user=" + user +
                ", commentTime='" + commentTime + '\'' +
                '}';
    }
}
