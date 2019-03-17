package com.zzq.service.impl;

import java.util.List;

import com.zzq.pojo.UserList;

public interface UserListService {
	
	public List<UserList> findByCondition(String name,Integer id,Integer pageNo,Integer pageSize);
	
	public int findCountByCondition(String name,Integer id);
	
	public int insertUserList(UserList userList);
	
	public int deleteUserList(int id);
	
	public UserList findUserById(int id);
	
	public int updateUserList(UserList userList);

}
