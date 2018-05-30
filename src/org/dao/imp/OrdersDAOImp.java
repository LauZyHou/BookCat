package org.dao.imp;

import org.dao.OrdersDAO;
import org.model.BkOdr;
import org.model.Orders;
import org.model.User;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

//订单处理
public class OrdersDAOImp extends HibernateDaoSupport implements OrdersDAO {

    //查询当前用户的历史订单
    @Override
    public List<Orders> getOrdersByUserId(int userid) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        // hql查询该用户的所有订单
        String hql = "from Orders where userByUserid.id=?";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 传入hql语句和'?'代换列表以做查询
        List<Orders> h_orders = (List<Orders>) ht.find(hql, userid);
        // 返回查询结果
        return (null == h_orders || h_orders.isEmpty()) ? null : h_orders;
    }

    //初次持久化订单(用户,时间,总价)
    @Override
    public Orders saveOrders(User usr, Timestamp time, Short sum) {
        //建立订单
        Orders odr=new Orders();
        //写入所属用户
        odr.setUserByUserid(usr);
        //写入当前时间
        Date date=new Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        odr.setTime(timestamp);
        //写入计算后的总价
        odr.setSum(sum);
        //持久化
        HibernateTemplate ht=this.getHibernateTemplate();
        ht.save(odr);
        ht.flush();
        return odr;
    }

    //持久化订单和书的关联
    @Override
    public void saveBkOdr(BkOdr bkodr) {
        HibernateTemplate ht=this.getHibernateTemplate();
        ht.save(bkodr);
    }

}
