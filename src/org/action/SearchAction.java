package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Book;
import org.service.SearchService;

import java.util.List;
import java.util.Map;


//查询书籍
public class SearchAction extends ActionSupport implements ModelDriven<Book> {
    private Book searchByForm=null;
    // 组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private SearchService sear;

    @Override
    public String execute() throws Exception {
        //调用Service层的方法尝试登录以获取Book对象
        List<Book> nbook=sear.search(searchByForm.getName());
        //登录成功时
        if (null != nbook){
            //将这个Book存在Session里
            Map sssn=ActionContext.getContext().getSession();
            sssn.put("book", nbook);
            return SUCCESS;
        }
        return ERROR;
    }

    public SearchService getSear() {
        return sear;
    }

    public void setSear(SearchService sear) {
        this.sear = sear;
    }

    @Override
    public Book getModel() {
        return searchByForm == null ? searchByForm = new Book() : searchByForm;
    }
}
