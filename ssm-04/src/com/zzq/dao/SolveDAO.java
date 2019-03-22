package com.zzq.dao;

import com.zzq.pojo.Solve;
import com.zzq.pojo.UserList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SolveDAO {

     List<Solve> selectByCondition(@Param("status")String status,
                                         @Param("name")String name,
                                         @Param("address")String address,
                                         @Param("userlist_id")Integer userlist_id);

     int selectCountByCondition(@Param("status")String status,
                                      @Param("name")String name,
                                      @Param("userlist_id")Integer userlist_id,
                                      @Param("address")String address);

     int deleteSolveById(Integer id);

     int insertSolve(Solve solve);

     int updateSolve(Solve solve);
}
