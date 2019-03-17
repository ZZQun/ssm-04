package com.zzq.dao;

import com.zzq.pojo.Schedule;
import com.zzq.pojo.UserList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleDAO {

    public List<Schedule> selectByCondition(@Param("pageNo")Integer pageNo,
                                            @Param("pageSize")Integer pageSize);

    public int selectCountByCondition();
}
