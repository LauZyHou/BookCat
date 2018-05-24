package org.service;

import org.model.Book;

import java.util.List;

public interface BookService {
    //用户想看热门书籍时，成功返回一个List<Book>
    List<Book> getHotBook();
}
