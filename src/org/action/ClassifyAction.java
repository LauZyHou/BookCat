package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.Book;
import org.service.BookService;

import java.util.List;
import java.util.Map;
import java.lang.*;

//根据分类获取
public class ClassifyAction extends ActionSupport {
    private BookService bs;

    public short getCategory() {
        return category;
    }

    public void setCategory(short category) {
        this.category = category;
    }

    private short category;

    public String execute() throws Exception {
        //调用Service层的方法获取热门书籍对象列表
        System.out.println(category);
        List<Book> bkclist=null;
        bkclist=bs.getCategoryBook(category);
        if(null != bkclist){
            Map sssn=ActionContext.getContext().getSession();
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
}
