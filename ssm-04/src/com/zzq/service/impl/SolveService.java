package com.zzq.service.impl;

import com.zzq.pojo.Solve;

import java.util.List;

public interface SolveService {

     List<Solve> findByCondition(String status,String name,String address,Integer userlist_id);
}
