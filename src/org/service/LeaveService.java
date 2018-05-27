package org.service;

import org.model.Leave;

import java.util.List;

public interface LeaveService{
    public List<Leave> getUserLeaves(int userid);
}
