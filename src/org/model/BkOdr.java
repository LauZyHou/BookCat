package org.model;

import java.util.Objects;

public class BkOdr {
    private int orderid;
    private int bookid;
    private short num;
    private Order orderByOrderid;
    private Book bookByBookid;

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

    public short getNum() {
        return num;
    }

    public void setNum(short num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BkOdr bkOdr = (BkOdr) o;
        return orderid == bkOdr.orderid &&
                bookid == bkOdr.bookid &&
                num == bkOdr.num;
    }

    @Override
    public int hashCode() {

        return Objects.hash(orderid, bookid, num);
    }

    public Order getOrderByOrderid() {
        return orderByOrderid;
    }

    public void setOrderByOrderid(Order orderByOrderid) {
        this.orderByOrderid = orderByOrderid;
    }

    public Book getBookByBookid() {
        return bookByBookid;
    }

    public void setBookByBookid(Book bookByBookid) {
        this.bookByBookid = bookByBookid;
    }
}
