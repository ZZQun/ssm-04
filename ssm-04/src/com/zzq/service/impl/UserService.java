package com.zzq.service.impl;

import com.zzq.pojo.User;

public interface UserService {

	 User login(String username,String password);
	
	 User selectByUsername(String username);
	
	 int insertUser(User user);
	
	 int deleteUser(int id);
	
	 boolean pwdModify(Integer id,String newPassword);
}
