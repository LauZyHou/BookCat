package org.service.imp;

import org.dao.BookDAO;
import org.dao.OrdersDAO;
import org.model.*;
import org.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.Random;

@SuppressWarnings("all")
public class OrdersServiceImp implements OrdersService {
    @Autowired
    BookDAO bk_d;
    @Autowired
    OrdersDAO odr_d;

    //生成订单的服务(用户,书籍-数目表,优惠券种类)
    @Override
    public Orders gnrtOrder(User usr, Map<Integer,Short> toGnrOdr_hs,Short cardType) {
        int sum=0;//总价
        //遍历这个Map(书id,书数目)
        for(Integer key:toGnrOdr_hs.keySet()){
            //将这本书所产生的价格加到总价上(单价*数目)
            sum+=((Book)bk_d.findBookById(key)).getPrice()*toGnrOdr_hs.get(key);
        }
        //按照使用的优惠券种类为其打折
        switch (cardType){
            case 1:
                sum= (int) (sum*0.99);
                System.out.println("使用1号卡,折扣0.99,折后:"+sum);
                break;
            case 2:
                sum= (int) (sum*0.9);
                System.out.println("使用2号卡,折扣0.9,折后:"+sum);
                break;
            case 3:
                //随机7到9折
                Random ra =new Random();
                double sale=ra.nextDouble()*(0.9-0.7)+0.7;
                sum= (int) (sum*sale);
                System.out.println("使用3号卡,折扣"+sale+",折后:"+sum);
                break;
            default:
                System.out.println("没有使用优惠卡:"+sum);
        }
        //计算当前时间
        Date date=new Date();
        Timestamp time=new Timestamp(date.getTime());
        //调用DAO作初始持久化,返回含有id的Orders脱管对象
        Orders odr=odr_d.saveOrders(usr,time, (short) sum);
        //持久化订单和书的关系
        for(Integer key:toGnrOdr_hs.keySet()){
            BkOdr bkodr=new BkOdr();
            //设定主键PK(订单号,书号)
            bkodr.setBkodrpk(new BkOdrPK(odr.getId(),key));
            //设定购买了这本书的数目
            bkodr.setNum(toGnrOdr_hs.get(key));
            //持久化该关联
            odr_d.saveBkOdr(bkodr);
        }
        return odr;
    }

    public BookDAO getBk_d() {
        return bk_d;
    }

    public void setBk_d(BookDAO bk_d) {
        this.bk_d = bk_d;
    }

    public OrdersDAO getOdr_d() {
        return odr_d;
    }

    public void setOdr_d(OrdersDAO odr_d) {
        this.odr_d = odr_d;
    }
}
