package org.service;

import org.model.Leave;

import java.util.List;

public interface LeaveService{
    List<Leave> getUserLeaves(int userid);
    //添加评论
    void addComments(int userid, int bookid, String comments) ;
    //根据书id获得留言
    List<Leave> findComments(int bookid);
}
