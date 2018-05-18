package org.dao.imp;

import org.dao.UserDAO;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.model.Login;
import org.model.User;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

@SuppressWarnings("all")
public class UserDAOImp extends HibernateDaoSupport implements UserDAO {

    @Override
    public User login_A(String name, String password) {
        // 书写hql语句
        String hql = "from User where name=? and password=?";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 传入hql语句和'?'代换列表以做查询
        List<User> ls_usr = (List<User>) ht.find(hql, name, password);
        // 返回查询结果
        return (null == ls_usr || ls_usr.isEmpty()) ? null : ls_usr.get(0);
    }

    // 登录时调用的验证方法(演示通过execute方法直接在Session上操作)
    // 当所在的方法的参数需要被内部类里面使用时，该参数必须为final以让该引用不可改变
    @Override
    public User login_B(String name, String password) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        final String hql = "from User where name=?0 and password=?1";
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        // 执行execute方法,传入HibernateCallback<T>接口
        List<User> ls_usr = (List<User>) ht
                .execute(new HibernateCallback<List<User>>() {
                    // 覆写其中的<T> doInHibernate方法,Session通过形参注入
                    @Override
                    public List<User> doInHibernate(Session sssn)
                            throws HibernateException {
                        // 用hql建立Query对象
                        Query qry = sssn.createQuery(hql);
                        // 设定?参数值(JPA方式设定参数要给数字加双引号)
                        qry.setParameter("0", name);
                        qry.setParameter("1", password);
                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        // 在外部类中做判读并返回
        return (null == ls_usr || ls_usr.isEmpty()) ? null : ls_usr.get(0);
    }


    //根据给定的name查询用户Login对象
    @Override
    public Login findLoginByName(String name) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        final String hql = "from Login where name=?1";
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        // 执行execute方法,传入HibernateCallback<T>接口
        List<Login> ls_lgn = (List<Login>) ht
                .execute(new HibernateCallback<List<Login>>() {
                    // 覆写其中的<T> doInHibernate方法,Session通过形参注入
                    @Override
                    public List<Login> doInHibernate(Session sssn)
                            throws HibernateException {
                        // 用hql建立Query对象
                        Query qry = sssn.createQuery(hql);
                        // 设定?参数值(JPA方式设定参数要给数字加双引号)
                        qry.setParameter("1", name);
                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        // 在外部类中做判读并返回
        return (null == ls_lgn || ls_lgn.isEmpty()) ? null : ls_lgn.get(0);
    }

}
