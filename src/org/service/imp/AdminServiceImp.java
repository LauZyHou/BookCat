package org.service.imp;

import org.dao.AdminDAO;
import org.dao.UserDAO;
import org.model.Book;
import org.model.User;
import org.service.AdminService;

public class AdminServiceImp implements AdminService {
    private AdminDAO ad_d;
    private UserDAO us_d;

    //根据Id查找用户信息
    public User findUser(int id){
        System.out.println("service");
        //调用Service层的方法获取对应ID的User对象
        User usr=ad_d.findUserbyId(id);
        System.out.println("service2");
        return usr;
    }
    //通过ID删除用户
    public void delUser(int id){
        //调用Service层的方法删除对应ID的User对象
        ad_d.delUserbyId(id);
    }

    //修改卡券数量
    public User updSale(String sl,int id,short number){
        //调用Service层的方法
        User usr=ad_d.updateSale(sl, id, number);
        return usr;
    }

    //通过ID获得书籍信息
    public Book findBook(int id){
        //调用Service层的方法获取对应ID的Book对象
        Book bk=ad_d.findBookbyId(id);
        return bk;
    }
    //根据ID删除book
    public void delBook(int id){
        //调用Service层的方法删除对应ID的Book对象
        ad_d.delBookbyId(id);
    }
    //修改书籍信息
    public Book updBook(String sl,int id,String number){
        //调用Service层的方法
        Book bk=ad_d.updateBook(sl, id, number);
        return bk;
    }


    public AdminDAO getAd_d() {
        return ad_d;
    }

    public void setAd_d(AdminDAO ad_d) {
        this.ad_d = ad_d;
    }


}
