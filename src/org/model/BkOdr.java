package org.model;

public class BkOdr {
    private short num;
    private Orders ordersByOrderid;
    private Book bookByBookid;
    private BkOdr bkodr;

    public BkOdr() {
    }

    public short getNum() {
        return num;
    }

    public void setNum(short num) {
        this.num = num;
    }

    public Orders getOrdersByOrderid() {
        return ordersByOrderid;
    }

    public void setOrdersByOrderid(Orders ordersByOrderid) {
        this.ordersByOrderid = ordersByOrderid;
    }

    public Book getBookByBookid() {
        return bookByBookid;
    }

    public void setBookByBookid(Book bookByBookid) {
        this.bookByBookid = bookByBookid;
    }

    public BkOdr getBkodr() {
        return bkodr;
    }

    public void setBkodr(BkOdr bkodr) {
        this.bkodr = bkodr;
    }
}
