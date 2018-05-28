package org.service.imp;

import org.model.Book;
import org.model.Leave;
import org.model.LeavePK;
import org.model.User;
import org.service.TestService;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.List;

//测试Service,请把它直接当做DAO用!
public class TestServiceImp extends HibernateDaoSupport implements TestService {
    //添加指定名称的书籍
    @Override
    public void addBook(String name) {
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        Book bk=new Book();
        bk.setName(name);
        ht.save(bk);
        ht.flush();
    }

    //添加留言的测试
    @Override
    public void addLeave() {
        HibernateTemplate ht = this.getHibernateTemplate();

        String hql_1="from User where id=?";
        List<User> usr_lst= (List<User>) ht.find(hql_1,1);
        User usr=usr_lst.get(0);
        System.out.println("--User查询完毕--");

        String hql_2="from Book where id=?";
        List<Book> bk_lst=(List<Book>) ht.find(hql_2,1);
        Book bk=bk_lst.get(0);
        System.out.println("--Book查询完毕--");

        Leave lv=new Leave();
        Date dt=new Date();
        Timestamp stp=new Timestamp(dt.getTime());
        System.out.println("--时间是:"+stp.toString()+"");
//        lv.setTime(stp);
        lv.setComments("啊啊啊");
        lv.setUserByUserid(usr);
        lv.setBookByBookid(bk);
        LeavePK lvpk=new LeavePK(usr.getId(),bk.getId(),stp);
        lv.setLvpk(lvpk);

//        Collection<Leave> usr_lvs=usr.getLeavesById();
//        System.out.println("--获取好了该User的全部Leave--");
//        usr_lvs.add(lv);
//        usr.setLeavesById(usr_lvs);

        ht.save(lv);
        System.out.println("--持久化完毕--");
    }
}
