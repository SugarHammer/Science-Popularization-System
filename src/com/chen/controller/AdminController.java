package com.chen.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chen.pojo.User;
import com.chen.service.AdminService;
import com.chen.pojo.Admin;
import com.chen.pojo.CulturalRelic;
import com.chen.pojo.Notice;
import com.chen.vo.UserVo;
import com.chen.vo.userSexVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 管理员登录验证
	@PostMapping("/adminLogin")
	public String AdminLogin(Model model, Admin admin, HttpServletRequest request) {

		boolean flag = adminService.adminLogin(admin);
		if (flag) {
			HttpSession session = request.getSession();
			session.setAttribute("name", admin.getName());
			session.setMaxInactiveInterval(6000);
			System.out.println("登录成功");
			return "backstage";
		} else {
			// modelAndView.setViewName("login");
			System.out.println("登录失败");
			model.addAttribute("msg", "登录失败！");
			return "login";
		}
	}

	//=========用户相关操作==========

	// 删除用户
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String DeleteUser(String userName) {

		System.out.println("删除用户："+userName);
		int rows = adminService.deleteUser(userName);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条数据！");
			return "OK";
		} else {
			System.out.println("ִ删除失败");
			return "F";
		}
	}

	//查询全部用户
	@RequestMapping(value = "/allUser",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String AllUser(@RequestParam(defaultValue="1",value="page")Integer page,@RequestParam(defaultValue="10",value="limit")Integer limit,@RequestParam(defaultValue="")String userName) throws JsonProcessingException {
		//创建一个jackson的对象映射器，用来解析数据
		ObjectMapper mapper = new ObjectMapper();
		//创建一个对象
		UserVo<User> user = adminService.queryAllUser(page,limit,userName);
		//将我们的对象解析成为json格式
		String str = mapper.writeValueAsString(user);
		System.out.println(user);
		//由于@ResponseBody注解，这里会将str转成json格式返回；十分方便
		return str;
	}

	//性别分组查询
	@RequestMapping(value = "/querySex",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String QuerySex() throws JsonProcessingException {
		//创建一个jackson的对象映射器，用来解析数据
		ObjectMapper mapper = new ObjectMapper();
		//创建一个对象
		List<userSexVo> userlist = adminService.querySex();
		//将我们的对象解析成为json格式
		List<userSexVo> user = new ArrayList<userSexVo>();
		for(userSexVo user1: userlist) {
			user.add(user1);
		}

		String str = mapper.writeValueAsString(user);
		//由于@ResponseBody注解，这里会将str转成json格式返回；十分方便
		return str;
	}

	//=========公告相关操作==========

	//查询全部公告
	@RequestMapping(value = "/allNotice",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String AllNotice(@RequestParam(defaultValue="1",value="page")Integer page,@RequestParam(defaultValue="10",value="limit")Integer limit) throws JsonProcessingException {
		//创建一个jackson的对象映射器，用来解析数据
		ObjectMapper mapper = new ObjectMapper();
		//创建一个对象
		UserVo<Notice> notice = adminService.queryNotice(page,limit);
		//将我们的对象解析成为json格式
		String str = mapper.writeValueAsString(notice);
		//由于@ResponseBody注解，这里会将str转成json格式返回；十分方便
		return str;
	}

	//删除公告
	@RequestMapping("/deleteNotice")
	@ResponseBody
	public String DeleteNotice(String id) {

		System.out.println("删除公告：" + id);
		int rows = adminService.deleteNotice(id);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "条数据！");
			return "OK";
		} else {
			System.out.println("ִ删除失败");
			return "F";
		}
	}

	//新增公告
	@RequestMapping(value = "/notice",produces = "application/json;charset=utf-8")
	public String Notice(Notice notice,Model model) {

		int row = adminService.addNotice(notice);
		if (row > 0) {
			System.out.println("成功添加" + row + "条公告！");
			model.addAttribute("msg", "OK");
		} else {
			System.out.println("ִ公告添加失败");
			model.addAttribute("msg", "F");
		}
		return "notice";
	}


	// 更新公告
	@RequestMapping("/updateNotice")
	@ResponseBody
	public String UpdateNotice(Notice notice) {

		int rows = adminService.updateNotice(notice);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "条公告！");
			return"OK";

		} else {
			System.out.println("ִ更新公告失败");
			return"F";
		}

	}

	//=========文物相关操作==========
	// 查询全部文物
	@RequestMapping(value = "/allCulturalRelic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String AllCulturalRelic(@RequestParam(defaultValue = "1", value = "page") Integer page,@RequestParam(defaultValue = "10", value = "limit") Integer limit,@RequestParam(defaultValue = "") String culturalRelicName) throws JsonProcessingException {
		// 创建一个jackson的对象映射器，用来解析数据
		ObjectMapper mapper = new ObjectMapper();
		// 创建一个对象
		UserVo<CulturalRelic> culturalRelic = adminService.queryAllCulturalRelic(page, limit, culturalRelicName);
		// 将我们的对象解析成为json格式
		String str = mapper.writeValueAsString(culturalRelic);
		// 由于@ResponseBody注解，这里会将str转成json格式返回；十分方便
		return str;
	}

	// 删除文物信息
	@RequestMapping("/deleteCulturalRelic")
	@ResponseBody
	public String DeleteCulturalRelic(String culturalRelicId) {

		int rows = adminService.deleteCulturalRelic(culturalRelicId);
		if (rows > 0) {
			System.out.println("成功删除" + rows + "件文物！");
			return "OK";
		} else {
			System.out.println("ִ删除文物失败");
			return "F";
		}
	}

	// 新增文物
	@RequestMapping(value = "/culturalRelic", produces = "application/json;charset=utf-8")
	public String addCulturalRelic(CulturalRelic culturalRelic, Model model,HttpServletRequest request) {

		String img = (String)request.getSession().getServletContext().getAttribute("img");
		culturalRelic.setImg(img);
		int row = adminService.addCulturalRelic(culturalRelic);
		if (row > 0) {
			System.out.println("成功添加" + row + "件文物！");
			model.addAttribute("msg", "OK");
		} else {
			System.out.println("ִ文物添加失败");
			model.addAttribute("msg", "F");
		}
		return "culturalRelic";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String saveImgAddress(MultipartFile file,HttpServletRequest request) throws IOException {
        /** 保存图片的路径，图片上传成功后，将路径保存到数据库 */
        String filePath = "D:\\XM\\4.7\\likeyou-museum-system-master\\WebContent\\img";
        /** 获取原始图片的扩展名 */
        String originalFilename = file.getOriginalFilename();
        /** 生成文件新的名字 */
        String newFileName = UUID.randomUUID() + originalFilename;
        /** 封装上传文件位置的全路径 */
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);

        /** 保存到数据库 */
        request.getSession().getServletContext().setAttribute("img",newFileName);

        return "OK";
    }

	// 修改文物
	@RequestMapping("/updateCulturalRelic")
	@ResponseBody
	public String UpdateCulturalRelic(CulturalRelic culturalRelic) {

		int rows = adminService.updateCulturalRelic(culturalRelic);
		if (rows > 0) {
			System.out.println("成功更新" + rows + "件文物！");
			return "OK";
		} else {
			System.out.println("ִ更新文物失败");
			return "F";
		}
	}


}
