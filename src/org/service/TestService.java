package org.service;

//测试Service,请把它直接当做DAO用!
public interface TestService {
    //添加指定名称的书籍
    void addBook(String name);
    //添加留言
    void addLeave();
}
