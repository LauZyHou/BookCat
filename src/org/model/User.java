package org.model;

import java.util.Collection;
import java.util.Objects;

public class User {
    private int id;//用户编号
    private String name;//用户名
    private boolean sex;//性别
    private String tel;//电话号码
    private String address;//收货地址
    private Integer money;//氪金数目
    private String motto;//读书宣言
    private Short sale1;//1型优惠券数目
    private Short sale2;//2型优惠券数目
    private Short sale3;//3型优惠券数目
    private Collection<Leave> leavesById;//该用户的留言
    private Login loginById;//对应的Login对象
    private Collection<Orders> ordersById;//该用户的订单

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

    public Collection<Orders> getOrdersById() {
        return ordersById;
    }

    public void setOrdersById(Collection<Orders> ordersById) {
        this.ordersById = ordersById;
    }
}
