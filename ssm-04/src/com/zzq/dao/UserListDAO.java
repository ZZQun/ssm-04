package com.zzq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zzq.pojo.User;
import com.zzq.pojo.UserList;

@Repository
public interface UserListDAO {

	public List<UserList> selectByCondition(@Param("name")String name,
			@Param("id")Integer id,@Param("pageNo")Integer pageNo,
			@Param("pageSize")Integer pageSize);
	
	public int selectCountByCondition(@Param("name")String name,
			@Param("id")Integer id);
	
	public int insertUserList(UserList userList);
	
	public int deleteUserList(int id);
	
	public UserList findUserById(@Param("id")int id);
	
	public int updateUserList(UserList userList);
}
