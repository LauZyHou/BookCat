package org.dao;

import org.model.Book;

import java.util.List;

public interface BookDAO {
    //获取前14名热门书籍
    List<Book> getHotBook();
    //根据书名查找书籍
    List<Book> findBookByName(String name);
}