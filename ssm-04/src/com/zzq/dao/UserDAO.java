package com.zzq.dao;

import org.apache.ibatis.annotations.Param;

import com.zzq.pojo.User;

public interface UserDAO {

	public User selectByUsernameAndPassword(@Param("username")String username,
			@Param("password")String password);
	
	public User selectByUsername(@Param("username")String username);
	
	public int insertUser(User user);
	
	public int deleteUser(int id);
	
	public int pwdModify(@Param("id")Integer id,@Param("newpassword")String newpassword);
}
