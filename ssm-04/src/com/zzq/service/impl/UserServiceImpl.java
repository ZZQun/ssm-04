package com.zzq.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zzq.dao.UserDAO;
import com.zzq.pojo.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDAO")
	private UserDAO userDao;
	
	@Override
	public User login(String username, String password) {
		
		return userDao.selectByUsernameAndPassword(username, password);
	}

	@Override
	public User selectByUsername(String username) {
		
		return userDao.selectByUsername(username);
	}

	@Override
	public int insertUser(User user) {
		int effectedNum = userDao.insertUser(user);
		return effectedNum;
	}

	@Override
	public int deleteUser(int id) {
		int effectedNum = userDao.deleteUser(id);
		return effectedNum;
	}

	@Override
	public boolean pwdModify(Integer id, String newPassword) {
		int effectedNum = userDao.pwdModify(id,newPassword);
		if(effectedNum > 0){
			return true;
		}else{
			return false;
		}
	}

}
