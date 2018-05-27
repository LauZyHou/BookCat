package org.dao.imp;

import org.dao.LeaveDAO;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.model.Book;
import org.model.Leave;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

public class LeaveDAOImp extends HibernateDaoSupport implements LeaveDAO {
    public List<Leave> getUserLeaves(int userid){
        String hql="from Leave where userid=?1";
        HibernateTemplate ht = this.getHibernateTemplate();
        // 执行execute方法,传入HibernateCallback<T>接口
        List<Leave> ls_leave = (List<Leave>) ht
                .execute(new HibernateCallback<List<Leave>>() {
                    // 覆写其中的<T> doInHibernate方法,Session通过形参注入
                    @Override
                    public List<Leave> doInHibernate(Session sssn)
                            throws HibernateException {
                        // 用hql建立Query对象
                        Query qry = sssn.createQuery(hql);
                        // 设定?参数值(JPA方式设定参数要给数字加双引号)
                        //qry.setParameter("1", name);
                        //qry.setFirstResult(0);
                        qry.setParameter("1", userid);

                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        if(ls_leave==null){System.out.print("查询结果为空");return null;}
        else {System.out.print("查询不为空");return ls_leave;}
    }

}
