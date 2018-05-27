package org.dao.imp;

import org.dao.OrdersDAO;
import org.model.Orders;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.util.List;

//查询当前用户的历史订单
public class OrdersDAOImp extends HibernateDaoSupport implements OrdersDAO {
    @Override
    public List<Orders> getOrdersByUserId(int userid) {
        // 书写hql语句(hibernate 4.1之后需使用命名参数或JPA方式占位符才不报警告)
        // hql查询该用户的所有订单
       String hql="from Orders where userid=?";
        // 获取HibernateTemplate对象,该对象具有操作数据库的常用方法,无需考虑Session
        HibernateTemplate ht = this.getHibernateTemplate();
        // 传入hql语句和'?'代换列表以做查询
        List<Orders> h_orders = (List<Orders>) ht.find(hql, userid);
        // 返回查询结果
        return (null == h_orders || h_orders.isEmpty()) ? null : h_orders;
    }
}
