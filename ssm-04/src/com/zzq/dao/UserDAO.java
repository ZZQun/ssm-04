package com.zzq.dao;

import org.apache.ibatis.annotations.Param;

import com.zzq.pojo.User;

public interface UserDAO {

	 User selectByUsernameAndPassword(@Param("username")String username,
			@Param("password")String password);
	
	 User selectByUsername(@Param("username")String username);
	
	 int insertUser(User user);
	
	 int deleteUser(int id);
	
	 int pwdModify(@Param("id")Integer id,@Param("newpassword")String newpassword);
}
