package com.prestech.chitchat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prestech.chitchat.model.LoginCredential;

@Controller
@RequestMapping("/login-credential")
public class AuthController {

	@RequestMapping("validate")
	public void validateCredential(LoginCredential loginCredential) {
		
	}
	
}
