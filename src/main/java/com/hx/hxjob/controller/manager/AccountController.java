package com.hx.hxjob.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("account")
@Controller
public class AccountController {

	@RequestMapping("index")
	public String accountPage() {
		return "manager/account";
	}
	
}
