package com.zzq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zzq.pojo.User;
import com.zzq.pojo.UserList;

@Repository
public interface UserListDAO {

	 List<UserList> selectByCondition(@Param("name")String name,
			@Param("id")Integer id,@Param("pageNo")Integer pageNo,
			@Param("pageSize")Integer pageSize);
	
	 int selectCountByCondition(@Param("name")String name,
			@Param("id")Integer id);
	
	 int insertUserList(UserList userList);
	
	 int deleteUserList(int id);
	
	 UserList findUserById(@Param("id")int id);
	
	 int updateUserList(UserList userList);
}
