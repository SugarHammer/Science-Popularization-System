package com.chen.controller;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.Configuration;

import com.chen.pojo.User;


public class UserControllerTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertUser() {
		UserController userController = new UserController();
		User user = new User();
		user.setUserName("陈廷锋");
		user.setUserEmail("123@qq.com");
		user.setUserPhone("12345678911");
		user.setUserPwd("123456");
		user.setUserSex("男");
		assertEquals("OK",userController.insertUser( user));
	}
	


}
