package com.jeecg.phone;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.web.system.controller.core.LoginController;
import org.jeecgframework.web.system.pojo.base.TSFunction;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/phoneController")
public class PhoneController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(PhoneController.class);
	private UserService userService;
	private SystemService systemService;

	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	public UserService getUserService() {
		return userService;

	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 手机页面预览
	 * 
	 * @return
	 */
	@RequestMapping(params = "review")
	public ModelAndView operationData(HttpServletRequest request) {
		LoginController login = new LoginController();
		Map<Integer, List<TSFunction>> functionMap = new HashMap<Integer, List<TSFunction>>();
		List<TSFunction> firstList = new ArrayList();
		List<TSFunction> secondList = new ArrayList();
		functionMap = login.getMenu();
		for (Map.Entry<Integer, List<TSFunction>> entry : functionMap
				.entrySet()) {
			for (TSFunction fun : entry.getValue()) {
				if (fun.getFunctionLevel() == 0) {
					firstList.add(fun);
				}
				if (fun.getFunctionLevel() == 1) {
					secondList.add(fun);
				}
			}
			// System.out.println("key= " + entry.getKey() + " and value= "
			// + entry.getValue());
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("phone/index");
		// JSONArray jsonObject = JSONArray.fromObject(list);
		request.setAttribute("firstMenu", firstList);
		request.setAttribute("secondMenu", secondList);
		return modelAndView;
	}
}
