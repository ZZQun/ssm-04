package com.zzq.dao;

import com.zzq.pojo.HouseList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseListDAO {

    public List<HouseList> selectByCondition(@Param("status")String status);

    public int selectCountByCondition(@Param("status")String status);
}
