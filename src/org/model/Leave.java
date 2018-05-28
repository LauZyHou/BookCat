package org.model;

import java.sql.Timestamp;
import java.util.Objects;

public class Leave {
    private String comments;//留言内容
    private User userByUserid;//留下该留言的用户
    private Book bookByBookid;//该留言基于的书
    private LeavePK lvpk;//[!]测试

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public User getUserByUserid() {
        return userByUserid;
    }

    public void setUserByUserid(User userByUserid) {
        this.userByUserid = userByUserid;
    }

    public Book getBookByBookid() {
        return bookByBookid;
    }

    public void setBookByBookid(Book bookByBookid) {
        this.bookByBookid = bookByBookid;
    }

    public LeavePK getLvpk() {
        return lvpk;
    }

    public void setLvpk(LeavePK lvpk) {
        this.lvpk = lvpk;
    }
}
