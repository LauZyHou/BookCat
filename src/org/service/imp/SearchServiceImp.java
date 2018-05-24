package org.service.imp;

import org.dao.BookDAO;
import org.model.Book;
import org.service.SearchService;

import java.util.List;

public class SearchServiceImp implements SearchService {

    private BookDAO book_d;

    //搜索业务
    public List<Book> search(String name){
        //按传入的书籍查询Book对象
        List<Book> nbook=book_d.findBookByName(name);

        //执行到此,说明没有匹配的书,返回空
        if(null==nbook)
            return null;//返回空,因为没有这个书,也就没有Book对象
        return nbook;
    }
    public BookDAO getBook_d() {
        return book_d;
    }

    public void setBook_d(BookDAO book_d) {
        this.book_d = book_d;
    }

}
