package org.service;

import org.model.Book;

import java.util.List;

public interface SearchService {
    //用户搜索书名,如果搜索成功将返回书籍列表
    List<Book> search(String name);
}
