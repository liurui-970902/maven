package com.liurui.Service;

import java.util.List;


import com.liurui.pojo.User;

public interface userService {
    /**
     * ²éÑ¯
     */
	public List<User> getUser(int id);
	
	/**
	 * Ôö
	 */
	public int add(User user);
	
	/**
	 * ¸Ä
	 */
	public int update(User user);
	
	/**
	 * É¾
	 */
	public int drop(int id);
}
