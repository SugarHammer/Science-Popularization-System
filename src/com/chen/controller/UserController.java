package com.chen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.pojo.CulturalRelic;
import com.chen.pojo.Enshrine;
import com.chen.pojo.Notice;
import com.chen.pojo.User;
import com.chen.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@CrossOrigin
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 用户注册
	@RequestMapping("/register")
	public String insertUser( User user) {
		System.out.println(user);
		int rows = userService.insertUser(user);
		if (rows > 0) {
			System.out.println("成功添加" + rows + "条数据！");
			return "loginoff1";
		} else {
			System.out.println("ִ添加失败");
			return "F";
		}
	}

	// 用户登录验证
	@PostMapping(value="/login",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String userLogin(User user, HttpServletRequest request) throws JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		System.out.println(user);
		boolean flag = userService.userLogin(user);
		if (flag) {
			HttpSession session = request.getSession();
			session.setAttribute("name", user.getUserName());
			session.setMaxInactiveInterval(6000);
			System.out.println("登录成功");
			String str = mapper.writeValueAsString(user);
			System.out.println(str);
			return str;
		} else {
			System.out.println("登录失败");
			return "F";
		}
	}

	@PostMapping("/1")
	public String userLogin1(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("name", user.getUserName());
		session.setMaxInactiveInterval(6000);
		System.out.println("跳转主页");
		return "table";
	}

	// 判断用户名
	@PostMapping("/judgeUser")
	@ResponseBody
	public String judgeUser(User user) {
		boolean flag = userService.judgeUser(user);
		if (flag) {
			return "OK";
		} else {
			return "F";
		}
	}

	// 通过用户名查找用户
	@RequestMapping(value = "/querUser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String QueryById(Model model, HttpServletRequest request) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("name");
		// System.out.println(username);
		User user = userService.queryUserById(username);
		model.addAttribute("user", userService.queryUserById(username));
		String str = mapper.writeValueAsString(user);
		return str;
	}

	// 修改密码
	@PostMapping("/updatePwd")
	@ResponseBody
	public String updatePwd(String userPwd, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		// System.out.println(name + userPwd);
		int i = userService.updatePwd(userPwd, name);
		if (i > 0) {
			System.out.println("密码更新成功");
			return "OK";
		} else {
			System.out.println("密码更新失败");
			return "F";
		}

	}

	// 密码比对
	@PostMapping("/pwd")
	@ResponseBody
	public String Pwd(String oldPwd, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		User user = userService.queryUserById(name);
		if (user.getUserPwd().equals(oldPwd)) {
			System.out.println("旧密码正确");
			return "OK";
		} else {
			System.out.println("旧密码不正确");
			return "F";
		}
	}

	// 更新用户信息
	@PostMapping("/updateUser")
	@ResponseBody
	public String updateUser(User user) {

		int r = userService.updateUser(user);
		if (r > 0) {
			System.out.println("用户信息更新成功");
			return "OK";
		} else {
			System.out.println("用户信息更新失败");
			return "F";
		}
	}

	// 最新公告
	@PostMapping(value = "/newNotice", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String newNotice() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		List<Notice> noticeVo = userService.newNotice();
		String str = mapper.writeValueAsString(noticeVo);
		// System.out.print(str);
		return str;
	}

	// 最新文物
	@PostMapping(value = "/newCu", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String newCu() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		List<CulturalRelic> no = userService.newCu();
		String str = mapper.writeValueAsString(no);
		// System.out.print(str);
		return str;
	}

	// 查询所有藏品
	@RequestMapping(value = "/queryCulturalRelic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryCulturalRelic() throws JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		List<CulturalRelic> culturalRelics = userService.queryCulturalRelic();
		// System.out.print(culturalRelics);
		String str = mapper.writeValueAsString(culturalRelics);
		return str;
	}

	// 查询用户收藏
	@RequestMapping(value = "/queryEnshrine",produces="application/json;charset=utf-8")
	@ResponseBody
	public String queryEnshrine(Enshrine enshrine) throws JsonProcessingException {

		System.out.print(enshrine.getName());
		ObjectMapper mapper = new ObjectMapper();
		List<Enshrine> enshrines = userService.queryEnshrine(enshrine);
		System.out.print(enshrines);
		String str = mapper.writeValueAsString(enshrines);
		return str;
	}

	// 查询用户收藏
	@RequestMapping(value = "/queryEnshrine1", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryEnshrine1(Enshrine enshrine) throws JsonProcessingException {

		System.out.println(enshrine);
		if(userService.queryEnshrine1(enshrine)) {
			System.out.println(2);
			return "OK";
		}
		System.out.println(3);
		return "F";
	}

	// 取消收藏
	@RequestMapping("/deleteUserEnshrine")
	@ResponseBody
	public String deleteUserEnshrine(Enshrine enshrine) {

		int rows = userService.deleteUserEnshrine(enshrine);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条收藏！");
			return "OK";
		} else {
			System.out.println("ִ删除收藏失败");
			return "F";
		}
	}

	// 收藏
	@RequestMapping("/userEnshrine")
	@ResponseBody
	public String userEnshrine(Enshrine enshrine) {
		System.out.println("进来了1111");
		int rows = userService.userEnshrine(enshrine);
		if (rows > 0) {
			System.out.println("成功添加" + rows + "条收藏！");
			return "OK";
		} else {
			System.out.println("ִ添加收藏失败");
			return "F";
		}
	}

}
