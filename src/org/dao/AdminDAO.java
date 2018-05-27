package org.dao;

import org.model.Book;
import org.model.User;

import java.util.List;

public interface AdminDAO {
 //通过ID获得用户信息
 User findUserbyId(int id);
 //通过ID删除用户
 void delUserbyId(int id);
 //通过ID查找用户，并修改卡券信息
 User updateSale(String sl, int id, short number);
 //通过ID获得书籍信息
 Book findBookbyId(int id);
 //通过ID删除用户
 void delBookbyId(int id);
 //修改书籍信息
 Book updateBook(String sl, int id, String number);
}
