package com.min.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	//로그인 화면으로 이동
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String LoginForm() {
		logger.info("Welcome LoginForm! 로그인 화면으로 이동합니다.");
		return "loginForm";
	}
	//drag and drop 화면으로 이동
	@RequestMapping(value = "/dragAndDrop.do", method = RequestMethod.GET)
	public String dragAndDrop() {
		logger.info("Welcome dragAndDrop! dragAndDrop 화면으로 이동합니다.");
		return "dragAndDrop";
	}
}
