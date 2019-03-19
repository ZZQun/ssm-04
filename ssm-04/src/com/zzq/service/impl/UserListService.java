package com.zzq.service.impl;

import java.util.List;

import com.zzq.pojo.UserList;

public interface UserListService {
	
	 List<UserList> findByCondition(String name,Integer id,Integer pageNo,Integer pageSize);
	
	 int findCountByCondition(String name,Integer id);
	
	 int insertUserList(UserList userList);
	
	 int deleteUserList(int id);
	
	 UserList findUserById(int id);
	
	 int updateUserList(UserList userList);

}
