package com.chen.service;

import java.util.List;

import com.chen.pojo.CulturalRelic;
import com.chen.pojo.Enshrine;
import com.chen.pojo.Notice;
import com.chen.pojo.User;

public interface UserService {
		
	// 用户注册
	int insertUser(User user);

	// 用户登录验证
	boolean userLogin(User user);
	
	//用户名判断
	public boolean judgeUser(User user);

	//通过id查用户
	public User queryUserById(String username);

	//更新用户密码
	public int updatePwd(String userPwd,String userName);

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
	int deleteUserEnshrine(Enshrine enshrine);
		
	//查询用户收藏
	List<Enshrine> queryEnshrine(Enshrine enshrine);
	
	//通过用户名和文物编号查询
	Boolean queryEnshrine1(Enshrine enshrine);

}
