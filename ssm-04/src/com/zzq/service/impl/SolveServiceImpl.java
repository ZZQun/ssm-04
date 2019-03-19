package com.zzq.service.impl;

import com.zzq.dao.SolveDAO;
import com.zzq.pojo.Solve;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("solveService")
public class SolveServiceImpl implements SolveService{

    @Resource(name="solveDAO")
    private SolveDAO solveDAO;

    @Override
    public List<Solve> findByCondition(String status, String name, String address, Integer userlist_id) {
        return solveDAO.selectByCondition(status,name,address,userlist_id);
    }
}
