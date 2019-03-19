package com.zzq.service.impl;

import com.zzq.pojo.HouseList;
import com.zzq.pojo.UserList;

import java.util.List;

public interface HouseListService {

     List<HouseList> findByCondition(String status);

     int findCountByCondition(String status);
}
