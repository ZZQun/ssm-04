package com.zzq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zzq.dao.UserListDAO;
import com.zzq.pojo.UserList;

@Service("userListService")
public class UserListServiceImpl implements UserListService {

	@Resource(name="userListDAO")
	private UserListDAO userListDao;
	
	@Override
	public List<UserList> findByCondition(String name, Integer id, Integer pageNo, Integer pageSize) {
		Integer page = (pageNo -1)*pageSize;
		return userListDao.selectByCondition(name,id,page,pageSize);
	}

	@Override
	public int findCountByCondition(String name, Integer id) {
		return userListDao.selectCountByCondition(name,id);
	}

	@Override
	public int insertUserList(UserList userList) {
		int effectedNum = userListDao.insertUserList(userList);
		return effectedNum;
	}

	@Override
	public int deleteUserList(int id) {
		int effectedNum = userListDao.deleteUserList(id);
		return effectedNum;
	}

	@Override
	public UserList findUserById(int id) {
		UserList ul = userListDao.findUserById(id);
		return ul;
	}

	@Override
	public int updateUserList(UserList userList) {
		int effectedNum = userListDao.updateUserList(userList);
		return effectedNum;
	}

}
