package org.action;

import com.opensymphony.xwork2.ActionSupport;

//处理购物车
public class DealShopCarAction extends ActionSupport {
    private int id;

    //增加
    public String increase() throws Exception{
        System.out.println(id);
        return SUCCESS;
    }

    //减少
    public String decrease() throws Exception{
        System.out.println(id);
        return SUCCESS;
    }

    //删除
    public String remove() throws Exception{
        System.out.println(id);
        return SUCCESS;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
