package org.model;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

public class Book {
    private int id;
    private String name;
    private String msg;
    private Short price;
    private Short category;
    private Short num;
    private Timestamp time;
    private Integer hotnum;
    private Collection<BkOdr> bkOdrsById;
    private Collection<Leave> leavesById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Short getPrice() {
        return price;
    }

    public void setPrice(Short price) {
        this.price = price;
    }

    public Short getCategory() {
        return category;
    }

    public void setCategory(Short category) {
        this.category = category;
    }

    public Short getNum() {
        return num;
    }

    public void setNum(Short num) {
        this.num = num;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getHotnum() {
        return hotnum;
    }

    public void setHotnum(Integer hotnum) {
        this.hotnum = hotnum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book book = (Book) o;
        return id == book.id &&
                Objects.equals(name, book.name) &&
                Objects.equals(msg, book.msg) &&
                Objects.equals(price, book.price) &&
                Objects.equals(category, book.category) &&
                Objects.equals(num, book.num) &&
                Objects.equals(time, book.time) &&
                Objects.equals(hotnum, book.hotnum);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, msg, price, category, num, time, hotnum);
    }

    public Collection<BkOdr> getBkOdrsById() {
        return bkOdrsById;
    }

    public void setBkOdrsById(Collection<BkOdr> bkOdrsById) {
        this.bkOdrsById = bkOdrsById;
    }

    public Collection<Leave> getLeavesById() {
        return leavesById;
    }

    public void setLeavesById(Collection<Leave> leavesById) {
        this.leavesById = leavesById;
    }
}
