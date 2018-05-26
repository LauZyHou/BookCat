package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Book;
import org.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

//点击某一本书的图片,将请求该书的详细信息
@SuppressWarnings("all")
public class BookMsgAction extends ActionSupport implements ModelDriven<Book> {
    Book requestBook=null;
    @Autowired
    private BookService bs;

    @Override
    public String execute() throws Exception {
        //查询并返回
        requestBook=bs.getBookById(requestBook.getId());
        //获取request(而不是Session)
        Map rqst= (Map) ActionContext.getContext().get("request");
        //绑定上去
        rqst.put("nowbook",requestBook);
        return SUCCESS;
    }

    @Override
    public Book getModel() {
        return null==requestBook?requestBook=new Book():requestBook;
    }

    public BookService getBs() {
        return bs;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }
}
