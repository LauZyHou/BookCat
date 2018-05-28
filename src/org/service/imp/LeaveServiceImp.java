package org.service.imp;

import org.dao.LeaveDAO;
import org.model.Leave;
import org.service.LeaveService;

import java.util.List;

@SuppressWarnings("all")
public class LeaveServiceImp implements LeaveService {
    private LeaveDAO leave_d;
    //根据用户姓名查询用户留言
    public List<Leave> getUserLeaves(int userid){
        List<Leave> user_l=leave_d.getUserLeaves(userid);
        return user_l;
    }

    @Override
    public void addComments(int userid, int bookid, String comments) {
        leave_d.addLeave(userid, bookid, comments);
    }

    @Override
    public List<Leave> findComments(int bookid) {
        List<Leave> leave_l=leave_d.findLeavesByBookId(bookid);
        if(null==leave_l)
            return null;
        return leave_l;
    }

    public LeaveDAO getLeave_d() {
        return leave_d;
    }

    public void setLeave_d(LeaveDAO leave_d) {
        this.leave_d = leave_d;
    }
}
