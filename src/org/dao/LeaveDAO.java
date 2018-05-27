package org.dao;

import org.model.Leave;

import java.util.List;

public interface LeaveDAO {
    public List<Leave> getUserLeaves(int userid);
}
