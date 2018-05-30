package org.dao.imp;

import org.dao.AdminDAO;
import org.model.Book;
import org.model.User;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

public class AdminDAOImp extends HibernateDaoSupport implements AdminDAO {
    //通过ID获得用户信息
    @Override
    public User findUserbyId(int id){
        // 书写hql语句
        System.out.println("Dao1");
        final String hql = "from User where id=?";
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        List<User> usr = ( List<User>)ht.find(hql, id);
        System.out.println("DAO2");
        // 返回查询结果
        return (null == usr || usr.isEmpty()) ? null : usr.get(0);
    }

    //根据ID删除用户
    public void delUserbyId(int id){
        User us=findUserbyId(id);
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        ht.delete(us);
    }

    //修改卡券数量，根据id得到用户信息，再根据修改的卡券种类及数量进行更新
    public User updateSale(String sl,int id,short number){
        User us=findUserbyId(id);
        if(sl.equals("sale1")){
            us.setSale1(number);
        }
        if(sl.equals("sale2")){
            us.setSale2(number);
        }
        if(sl.equals("sale3")){
            us.setSale3(number);
        }
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        ht.update(us);
        return us;
    }

    //通过ID获得书籍信息
    public Book findBookbyId(int id){
        // 书写hql语句
        final String hql = "from Book where id=?";
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        List<Book> bk = ( List<Book>)ht.find(hql, id);
        // 返回查询结果
        return (null == bk || bk.isEmpty()) ? null : bk.get(0);
    }

    //根据ID删除book
    public void delBookbyId(int id){
        Book bk=findBookbyId(id);
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        ht.delete(bk);
    }

    //修改书籍数据，库存num，热度hotnum，定价price，分类catogory
    public Book updateBook(String sl,int id,String number){
        Book bk=findBookbyId(id);
        if(sl.equals("num")){
            short num=Short.parseShort(number);
           bk.setNum(num);
        }
        if(sl.equals("hotnum")){
            int num=Integer.parseInt(number);
            bk.setHotnum(num);
        }
        if(sl.equals("price")){
            short price=Short.parseShort(number);
            bk.setPrice(price);
        }
        if(sl.equals("category")){
            short cate=Short.parseShort(number);
            bk.setCategory(cate);
        }
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        ht.update(bk);
        return bk;
    }
}
