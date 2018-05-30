package org.service.imp;

import org.dao.BookDAO;
import org.model.Book;
import org.service.BookService;

import java.util.List;
import java.util.Map;

public class BookServiceImp implements BookService {
    private BookDAO book_d;
    //热门排序业务
    public List<Book> getHotBook(){
        //查询热门书籍并返回一个按热度从高到低的List<book>,大小为14.
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

    //获取书的留言
    @Override
    public List<Book> getCategoryBook(short category) {
        List<Book> cate_b=book_d.getCategoryBook(category);
        return cate_b;
    }

    //检查某书库存不足
    @Override
    public boolean checkBooksNumSufficient(Map<Integer, Short> mp) {
        //对于其中的每本书
        for(Integer key:mp.keySet()){
            Book bk=book_d.findBookById(key);
            if(null==bk.getNum() || mp.get(key)>bk.getNum()){
                return false;
            }
        }
        return true;
    }

    public void setBook_d(BookDAO book_d) {
        this.book_d = book_d;
    }

    public BookDAO getBook_d() {
        return book_d;
    }
}
