package com.liurui.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liurui.pojo.User;

public interface UserMapper {
     /**
      * ��ѯ
      */
	public List<User> getUser(@Param("id")int id);
	
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
	public int drop(@Param("id")int id);
}
