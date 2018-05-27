package org.service.imp;

import org.dao.BookDAO;
import org.model.Book;
import org.service.BookService;

import java.util.List;

public class BookServiceImp implements BookService {
    private BookDAO book_d;
    //热门排序业务
    public List<Book> getHotBook(){
        //查询热门书籍并返回一个按热度从高到低的List<book>，大小为14.
        System.out.print("测试service");
        List<Book> hot_b=book_d.getHotBook();
        return hot_b;
    }

    //获取指定书业务
    @Override
    public Book getBookById(int id) {
        return book_d.findBookById(id);
    }

    //添加图书
    @Override
    public Book add(Book bk) {
        //运行至此,要对书籍进行添加
        return book_d.createBook(bk);
    }

    public void setBook_d(BookDAO book_d) {
        this.book_d = book_d;
    }

    public BookDAO getBook_d() {
        return book_d;
    }
}
