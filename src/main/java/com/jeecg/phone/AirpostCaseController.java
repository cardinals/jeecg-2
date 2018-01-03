package com.jeecg.phone;

import org.jeecgframework.core.common.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/airpostCaseController")
public class AirpostCaseController  extends BaseController {

	
	@RequestMapping(params = "caseForm")
	public ModelAndView getForm(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("case/ct");
		return modelAndView;
		
	}
}
