package com.chen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.chen.pojo.CulturalRelic;
import com.chen.pojo.Enshrine;
import com.chen.pojo.Notice;
import com.chen.pojo.User;

public interface UserMapper {
	// 用户注册
	public int insertUser(User user);

	// 用户登录判断
	public User userLogin(@Param("user_name")String name);

	//更新密码
	public int updatePwd(@Param("user_pwd")String userPwd,@Param("user_name")String userName);

	//更新用户信息
	public int updateUser(User user);
	
	//最新公告
	public List<Notice> newNotice();
	
	//最新文物
	public List<CulturalRelic> newCu();
	
	//查询所有文物
	public List<CulturalRelic> queryCulturalRelic();
	
	//添加用户收藏
	int userEnshrine(Enshrine enshrine);
	
	//删除用户收藏
	int deleteUserEnshrine(int id);
		
	//查询用户收藏
	List<Enshrine> queryEnshrine(Enshrine enshrine);
	
	//通过用户名和文物编号查询
	Enshrine queryEnshrine1(Enshrine enshrine);
	
	
}
