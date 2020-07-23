package com.liurui.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liurui.pojo.User;

public interface UserMapper {
     /**
      * ²éÑ¯
      */
	public List<User> getUser(@Param("id")int id);
	
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
	public int drop(@Param("id")int id);
}
