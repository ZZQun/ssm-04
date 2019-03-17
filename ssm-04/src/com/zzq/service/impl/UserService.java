package com.zzq.service.impl;

import com.zzq.pojo.User;

public interface UserService {

	public User login(String username,String password);
	
	public User selectByUsername(String username);
	
	public int insertUser(User user);
	
	public int deleteUser(int id);
	
	public boolean pwdModify(Integer id,String newPassword);
}
