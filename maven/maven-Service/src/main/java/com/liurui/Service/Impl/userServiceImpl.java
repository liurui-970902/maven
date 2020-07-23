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
	 * ²éÑ¯
	 */
	public List<User> getUser(int id) {
		return um.getUser(id);
	}

	/**
	 * Ôö
	 */
	public int add(User user) {
		return um.add(user);
	}

	/**
	 * ¸Ä
	 */
	public int update(User user) {
		return um.update(user);
	}

	/**
	 * É¾³ý
	 */
	public int drop(int id) {
		return um.drop(id);
	}

}
