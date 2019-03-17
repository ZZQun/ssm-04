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
    public List<Paid> findByCondition(String status, String name, String address, Integer userlist_id, Integer pageNo, Integer pageSize) {
        Integer page = (pageNo -1)*pageSize;
        return paidDAO.selectByCondition(status,name,address,userlist_id,page,pageSize);
    }

    @Override
    public int findCountByCondition(String status, String name, String address, Integer userlist_id) {
        return paidDAO.selectCountByCondition(status,name,userlist_id,address);
    }


}
