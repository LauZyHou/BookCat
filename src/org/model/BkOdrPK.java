package org.model;

import java.io.Serializable;
import java.util.Objects;

public class BkOdrPK implements Serializable {
    private int orderid;
    private int bookid;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public BkOdrPK() {
    }

    public BkOdrPK(int orderid, int bookid) {
        this.orderid = orderid;
        this.bookid = bookid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BkOdrPK bkOdrPK = (BkOdrPK) o;
        return orderid == bkOdrPK.orderid &&
                bookid == bkOdrPK.bookid;
    }

    @Override
    public int hashCode() {

        return Objects.hash(orderid, bookid);
    }
}
