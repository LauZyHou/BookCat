package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Book;
import org.service.BookService;


import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.lang.*;


//根据分类按热门排序
public class ChoiceAction extends ActionSupport {
    private BookService bs;

    public int getChoicevalue() {
        return choicevalue;
    }

    public void setChoicevalue(int choicevalue) {
        this.choicevalue = choicevalue;
    }

    private int choicevalue;

    public String execute() throws Exception {
        Map sssn = ActionContext.getContext().getSession();
        List<Book> bkclist = (List<Book>) sssn.get("bkclist");
        if (choicevalue == 0) {
            java.util.Collections.sort(bkclist, new HotnumCompartor());
            java.util.Collections.reverse(bkclist);
        } else if (choicevalue == 1) {
            java.util.Collections.sort(bkclist, new PriceCompartor());
            java.util.Collections.reverse(bkclist);
        }
        if (bkclist != null) {
            sssn.put("bkclist", bkclist);
            return SUCCESS;
        }
        return ERROR;
    }


    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public BookService getBs() {
        return bs;
    }

    public class HotnumCompartor implements Comparator {
        public int compare(Object object1, Object object2) {// 实现接口中的方法
            Book p1 = (Book) object1; // 强制转换
            Book p2 = (Book) object2;
            return new Integer(p1.getHotnum()).compareTo(new Integer(p2.getHotnum()));
        }
    }

    public class PriceCompartor implements Comparator {
        public int compare(Object object1, Object object2) {// 实现接口中的方法
            Book p1 = (Book) object1; // 强制转换
            Book p2 = (Book) object2;
            return new Integer(p1.getPrice()).compareTo(new Integer(p2.getPrice()));
        }
    }
}
