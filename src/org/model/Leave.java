package org.model;

import java.sql.Timestamp;
import java.util.Objects;

public class Leave {
    private int userid;
    private int bookid;
    private String comments;
    private Timestamp time;
    private User userByUserid;
    private Book bookByBookid;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Leave leave = (Leave) o;
        return userid == leave.userid &&
                bookid == leave.bookid &&
                Objects.equals(comments, leave.comments) &&
                Objects.equals(time, leave.time);
    }

    @Override
    public int hashCode() {

        return Objects.hash(userid, bookid, comments, time);
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
}
