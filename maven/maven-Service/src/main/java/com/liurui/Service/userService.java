package com.liurui.Service;

import java.util.List;


import com.liurui.pojo.User;

public interface userService {
    /**
     * ��ѯ
     */
	public List<User> getUser(int id);
	
	/**
	 * ��
	 */
	public int add(User user);
	
	/**
	 * ��
	 */
	public int update(User user);
	
	/**
	 * ɾ
	 */
	public int drop(int id);
}
