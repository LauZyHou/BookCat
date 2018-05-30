package org.dao.imp;

import org.dao.BookDAO;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.model.Book;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


@SuppressWarnings("all")
public class BookDAOImp extends HibernateDaoSupport implements BookDAO {
    //获取热门书籍
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
        if (ls_htk == null) {
            System.out.print("查询结果为空");
            return null;
        } else {
            System.out.print("查询不为空");
            return ls_htk;
        }
    }

    //根据书名查找书籍
    public List<Book> findBookByName(String name) {
        // 书写hql语句
        //from Book where name like :name
        String hql = "from Book where name like :name";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 执行execute方法,传入HibernateCallback<T>接口
        List<Book> ls_book = (List<Book>) ht
                .execute(new HibernateCallback<List<Book>>() {
                    // 覆写其中的<T> doInHibernate方法,Session通过形参注入
                    @Override
                    public List<Book> doInHibernate(Session sssn)
                            throws HibernateException {
                        // 用hql建立Query对象
                        Query qry = sssn.createQuery(hql);
                        // 设定?参数值(JPA方式设定参数要给数字加双引号)
                        qry.setParameter("name", "%" + name + "%");
                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });

        // 返回查询结果
        return (null == ls_book || ls_book.isEmpty()) ? null : ls_book;
    }

    //根据id查找书籍
    @Override
    public Book findBookById(int id) {
        // 书写hql语句
        String hql = "from Book where id=?";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 传入hql语句和'?'代换列表以做查询
        List<Book> ls_book = (List<Book>) ht.find(hql, id);
        // 返回查询结果
        return (null == ls_book || ls_book.isEmpty()) ? null : ls_book.get(0);
    }


    //持久化书籍
    @Override
    public Book createBook(Book bk) {
        //建立对象
        Date date = new Date();
        int hot = 10;
        Timestamp df = new Timestamp(date.getTime());
        bk.setTime(df);
        bk.setHotnum(hot);
        //获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        //保存持久化对象到数据库
        ht.save(bk);
        return bk;
    }

    @Override
    public List<Book> getHotnumBook() {
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
                        qry.setMaxResults(17);

                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        if (ls_htk == null) {
            System.out.print("查询结果为空");
            return null;
        } else {
            System.out.print("查询不为空");
            return ls_htk;
        }
    }

    @Override
    public List<Book> getCategoryBook(short category) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        final String hql = "from Book where category=?1";
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
                        qry.setParameter("1", category);
                        qry.setFirstResult(0);
                        qry.setMaxResults(18);

                        // 查询并返回结果,不用考虑Session的开关
                        return qry.list();
                    }
                });
        if (ls_htk == null) {
            System.out.print("查询结果为空");
            return null;
        } else {
            System.out.print("查询不为空");
            return ls_htk;
        }
    }
}
