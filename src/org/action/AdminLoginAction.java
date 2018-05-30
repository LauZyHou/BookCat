package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.model.Book;
import org.model.Login;
import org.model.User;
import org.service.BookService;
import org.service.UserService;

import java.util.List;
import java.util.Map;

//管理员登录
@SuppressWarnings("all")
public class AdminLoginAction extends ActionSupport implements ModelDriven<Login> {
    private Login lgn;//普通Login对象伪装成管理员对象
    private BookService bs;
    private UserService us;

    public Login getLgn() {
        return lgn;
    }

    public void setLgn(Login lgn) {
        this.lgn = lgn;
    }

    public BookService getBs() {
        return bs;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public UserService getUs() {
        return us;
    }

    public void setUs(UserService us) {
        this.us = us;
    }

    @Override
    public String execute() throws Exception {
        //方便开发
        if(0==lgn.getName().length() && 0==lgn.getPassword().length() || lgn.getName().equals("lzh") && lgn.getPassword().equals("3838438")){
            List<Book> bkhlist=null;
            List<User> userslist=null;
            bkhlist=bs.getHotBook();
            userslist=us.findallusersByMoney();
            if (null != bkhlist && null != userslist) {
                Map sssn = ActionContext.getContext().getSession();
                sssn.put("bkhlist", bkhlist);
                sssn.put("userslist", userslist);
                return SUCCESS;
            }
            return ERROR;
        }
        return ERROR;
    }

    @Override
    public Login getModel() {
        return null==lgn?lgn=new Login():lgn;
    }
}
