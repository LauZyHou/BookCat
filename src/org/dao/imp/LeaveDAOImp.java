package org.dao.imp;
import org.dao.LeaveDAO;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.model.Leave;
import org.model.LeavePK;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@SuppressWarnings("all")
public class LeaveDAOImp extends HibernateDaoSupport implements LeaveDAO {
    public List<Leave> getUserLeaves(int userid){
        String hql="from Leave where lvpk.userid=?1 order by lvpk.time";
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

    @Override
    public void addLeave(int userid, int bookid, String comments) {
        Leave leave=new Leave();
        Date date=new Date();
        Timestamp time=new Timestamp(date.getTime());
        LeavePK leavePK=new LeavePK(userid,bookid,time);
        leave.setLvpk(leavePK);
        leave.setComments(comments);
        //获取HibernateTemplate对象
        HibernateTemplate ht = this.getHibernateTemplate();
        ht.save(leave);
    }

    @Override
    public List<Leave> findLeavesByBookId(int bookid) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        // hql查询该用户的所有订单
        String hql="from Leave where lvpk.bookid=? order by lvpk.time";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 传入hql语句和'?'代换列表以做查询
        List<Leave> h_leaves = (List<Leave>) ht.find(hql, bookid);
        // 返回查询结果
        return (null == h_leaves || h_leaves.isEmpty()) ? null : h_leaves;
    }
}
