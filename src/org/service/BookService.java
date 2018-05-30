package org.service;

import org.model.Book;

import java.util.List;
import java.util.Map;

public interface BookService {
    //用户想看热门书籍时,成功返回一个List<Book>
    List<Book> getHotBook();
    //用户请求查看某一本书,提供了确切的id号
    Book getBookById(int id);
    //添加图书
    Book add(Book bk);
    //李喆雯
    List<Book> getCategoryBook(short category);
    //检查一些书的库存是否不足
    boolean checkBooksNumSufficient(Map<Integer,Short> mp);
}
