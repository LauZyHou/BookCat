package org.dao.imp;

import org.dao.BookDAO;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.model.Book;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

public class BookDAOImp extends HibernateDaoSupport implements BookDAO {
    public List<Book> getHotBook() {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        final String hql = "from Book order by hotnum desc";
        // 获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        // 执行execute方法,传入HibernateCallback<T>接口
        List<Book> ls_htk = (List<Book>) ht
                .execute(new HibernateCallback<List<Book>>() {
                    // 覆写其中的<T> doInHibernate方法,Session通过形参注入
                    @Override
                    public List<Book> doInHibernate(Session sssn)
                            throws HibernateException {
                        // 用hql建立Query对象
                        Query qry = sssn.createQuery(hql);
                        // 设定?参数值(JPA方式设定参数要给数字加双引号)
                        //qry.setParameter("1", name);
                        qry.setFirstResult(0);
                        qry.setMaxResults(14);

                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        if(ls_htk==null){System.out.print("查询结果为空");return null;}
        else {System.out.print("查询不为空");return ls_htk;}
    }
}
