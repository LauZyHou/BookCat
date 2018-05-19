package org.model;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

public class Orders {
    private int id;
    private int userid;
    private short sum;
    private Timestamp time;
    private Collection<BkOdr> bkOdrsById;
    private User userByUserid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public short getSum() {
        return sum;
    }

    public void setSum(short sum) {
        this.sum = sum;
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
        Orders orders = (Orders) o;
        return id == orders.id &&
                userid == orders.userid &&
                sum == orders.sum &&
                Objects.equals(time, orders.time);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, userid, sum, time);
    }

    public Collection<BkOdr> getBkOdrsById() {
        return bkOdrsById;
    }

    public void setBkOdrsById(Collection<BkOdr> bkOdrsById) {
        this.bkOdrsById = bkOdrsById;
    }

    public User getUserByUserid() {
        return userByUserid;
    }

    public void setUserByUserid(User userByUserid) {
        this.userByUserid = userByUserid;
    }
}
