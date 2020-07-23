package com.liurui.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liurui.Dao.UserMapper;
import com.liurui.Service.userService;
import com.liurui.pojo.User;
@Service(value="userService")
public class userServiceImpl implements userService {
	
	@Autowired
	private UserMapper um;

	/**
	 * ��ѯ
	 */
	public List<User> getUser(int id) {
		return um.getUser(id);
	}

	/**
	 * ��
	 */
	public int add(User user) {
		return um.add(user);
	}

	/**
	 * ��
	 */
	public int update(User user) {
		return um.update(user);
	}

	/**
	 * ɾ��
	 */
	public int drop(int id) {
		return um.drop(id);
	}

}
