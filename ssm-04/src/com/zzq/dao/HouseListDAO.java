package com.zzq.dao;

import com.zzq.pojo.HouseList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseListDAO {

     List<HouseList> selectByCondition(@Param("status")String status);

     int selectCountByCondition(@Param("status")String status);

     HouseList selectHouseLustById(Integer houseId);

     int deleteHouseListById(Integer houseId);

     int insertHouseList(HouseList houseList);

     int updateHouseList(HouseList houseList);
}
