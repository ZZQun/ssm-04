package com.zzq.service.impl;

import com.zzq.pojo.HouseList;
import com.zzq.pojo.UserList;

import java.util.List;

public interface HouseListService {

    public List<HouseList> findByCondition(String status);

    public int findCountByCondition(String status);
}
