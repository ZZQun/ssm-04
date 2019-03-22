package com.zzq.service.impl;

import com.zzq.dao.HouseListDAO;
import com.zzq.dao.PaidDAO;
import com.zzq.pojo.Paid;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("paidService")
public class PaidServiceImpl implements PaidService{

    @Resource(name="paidDAO")
    private PaidDAO paidDAO;

    @Override
    public List<Paid> findByCondition(String status, String name, String address, Integer userlist_id) {
        return paidDAO.selectByCondition(status,name,address,userlist_id);
    }

}
