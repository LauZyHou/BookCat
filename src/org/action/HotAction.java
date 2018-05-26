package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Book;
import org.service.BookService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//热门排序
public class HotAction extends ActionSupport {
    private BookService bs;
    public String execute() throws Exception {
        //调用Service层的方法获取热门书籍对象列表
        List<Book> hbooks=null;
        hbooks=bs.getHotBook();
        Map sssn=ActionContext.getContext().getSession();
        sssn.put("hbooks", hbooks);
        return SUCCESS;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public BookService getBs() {
        return bs;
    }
}
