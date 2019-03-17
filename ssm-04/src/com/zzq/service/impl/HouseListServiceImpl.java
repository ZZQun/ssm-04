package com.zzq.service.impl;

import com.zzq.dao.HouseListDAO;
import com.zzq.dao.UserListDAO;
import com.zzq.pojo.HouseList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("houseListService")
public class HouseListServiceImpl implements HouseListService{

    @Resource(name="houseListDAO")
    private HouseListDAO houseListDAO;

    @Override
    public List<HouseList> findByCondition(String status) {
        return houseListDAO.selectByCondition(status);
    }

    @Override
    public int findCountByCondition(String status) {
        return houseListDAO.selectCountByCondition(status);
    }
}
