package org.model;

import java.io.Serializable;
import java.util.Objects;

public class LeavePK implements Serializable {
    private int userid;
    private int bookid;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LeavePK leavePK = (LeavePK) o;
        return userid == leavePK.userid &&
                bookid == leavePK.bookid;
    }

    @Override
    public int hashCode() {

        return Objects.hash(userid, bookid);
    }
}
