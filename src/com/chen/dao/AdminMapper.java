package com.chen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chen.pojo.Admin;
import com.chen.pojo.CulturalRelic;
import com.chen.pojo.Notice;
import com.chen.pojo.User;
import com.chen.vo.userSexVo;

public interface AdminMapper {
	
	//管理员登录判断
	public Admin adminLogin(@Param("name")String name);
	
	//==============用户操作相关===========

	//查询全部用户信息
	public List<User> queryAllUser(@Param("start")Integer page,@Param("size")Integer limit,@Param("userName")String userName);

	//查询用户总数
	public int countUser();
	
	//删除用户
	public int deleteUser(@Param("user_name")String userName);
	
	//性别分组
	public List<userSexVo> querySex();
	
	//==============公告操作相关===========
	
	//查询全部公告信息
	public List<Notice> queryNotice(@Param("start")Integer page,@Param("size")Integer limit);
	
	//删除公告
	public int deleteNotice(@Param("id")String id);
	
	//查询公告总数
	public int countNotice();
	
	//新增公告
	public int addNotice(Notice notice);
	
	//更新公告
	public int updateNotice(Notice notice);
	
	//==============文物操作相关===========
	
	// 查询全部文物信息
	public List<CulturalRelic> queryAllCulturalRelic(@Param("start") Integer page, @Param("size") Integer limit,@Param("culturalRelicName") String culturalRelicName);

	// 查询文物总数
	public int countCulturalRelic();

	// 删除文物
	public int deleteCulturalRelic(@Param("cultural_relic_id") String CulturalRelicId);
	
	// 新增文物
	public int addCulturalRelic(CulturalRelic culturalRelic);

	// 更新文物信息
	public int updateCulturalRelic(CulturalRelic culturalRelic);
	
}
