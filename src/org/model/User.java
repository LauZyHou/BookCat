package org.model;

import java.util.Collection;
import java.util.Objects;

public class User {
    private int id;
    private String name;
    private boolean sex;
    private String tel;
    private String address;
    private Integer money;
    private String motto;
    private Short sale1;
    private Short sale2;
    private Short sale3;
    private Collection<Leave> leavesById;
    private Login loginById;
    private Collection<Order> ordersById;

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

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getMotto() {
        return motto;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public Short getSale1() {
        return sale1;
    }

    public void setSale1(Short sale1) {
        this.sale1 = sale1;
    }

    public Short getSale2() {
        return sale2;
    }

    public void setSale2(Short sale2) {
        this.sale2 = sale2;
    }

    public Short getSale3() {
        return sale3;
    }

    public void setSale3(Short sale3) {
        this.sale3 = sale3;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                sex == user.sex &&
                Objects.equals(name, user.name) &&
                Objects.equals(tel, user.tel) &&
                Objects.equals(address, user.address) &&
                Objects.equals(money, user.money) &&
                Objects.equals(motto, user.motto) &&
                Objects.equals(sale1, user.sale1) &&
                Objects.equals(sale2, user.sale2) &&
                Objects.equals(sale3, user.sale3);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, sex, tel, address, money, motto, sale1, sale2, sale3);
    }

    public Collection<Leave> getLeavesById() {
        return leavesById;
    }

    public void setLeavesById(Collection<Leave> leavesById) {
        this.leavesById = leavesById;
    }

    public Login getLoginById() {
        return loginById;
    }

    public void setLoginById(Login loginById) {
        this.loginById = loginById;
    }

    public Collection<Order> getOrdersById() {
        return ordersById;
    }

    public void setOrdersById(Collection<Order> ordersById) {
        this.ordersById = ordersById;
    }
}
