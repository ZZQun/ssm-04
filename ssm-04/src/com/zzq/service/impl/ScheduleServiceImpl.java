package com.zzq.service.impl;

import com.zzq.dao.ScheduleDAO;
import com.zzq.pojo.Schedule;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{

    @Resource(name="scheduleDAO")
    private ScheduleDAO scheduleDAO;

    @Override
    public List<Schedule> findByCondition() {
        return scheduleDAO.selectByCondition();
    }
}
