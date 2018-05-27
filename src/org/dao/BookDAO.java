package org.dao;

import org.model.Book;

import java.util.List;

public interface BookDAO {
    //获取前14名热门书籍
    List<Book> getHotBook();
    //根据书名模糊查找书籍
    List<Book> findBookByName(String name);
    //根据id查找书籍
    Book findBookById(int id);
    //持久化Book,返回脱管Book
    Book createBook(Book bk);
    //李喆雯
    List<Book> getHotnumBook();
    List<Book> getCategoryBook(short category);
}
