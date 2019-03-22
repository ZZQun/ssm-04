package com.zzq.dao;

import com.zzq.pojo.Schedule;
import com.zzq.pojo.UserList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleDAO {

     List<Schedule> selectByCondition();

     int deleteScheduleById(Integer id);

     int insertSchedule(Schedule schedule);

     int uodateSchedule(Schedule schedule);
}
