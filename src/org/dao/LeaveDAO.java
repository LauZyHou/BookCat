package org.dao;

import org.model.Leave;

import java.util.List;

public interface LeaveDAO {
    //获取用户的所有留言
    List<Leave> getUserLeaves(int userid);
    //添加留言
    void addLeave(int userid, int bookid, String comments);
    //根据书id找到留言
    List<Leave> findLeavesByBookId(int bookid);
}
