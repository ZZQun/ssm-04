package com.zzq.service.impl;

import com.zzq.pojo.HouseList;
import com.zzq.pojo.Paid;

import java.util.List;

public interface PaidService {

     List<Paid> findByCondition(String status, String name, String address, Integer userlist_id);

}
