package org.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

public class LeavePK implements Serializable {
    private int userid;
    private int bookid;
    private Timestamp time;

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
        org.model.LeavePK leavePK = (org.model.LeavePK) o;
        return userid == leavePK.userid &&
                bookid == leavePK.bookid &&
                Objects.equals(time, leavePK.time);
    }

    @Override
    public int hashCode() {

        return Objects.hash(userid, bookid, time);
    }
}

