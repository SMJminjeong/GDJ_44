package com.min.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.edu.model.service.IBoardService;
import com.min.edu.model.service.IMemberService;
import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	private IBoardService iService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "main";
	}
	
	//1) 게시글 전체조회
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(MemberVo mVo, Model model) {
		log.info("BoardController 전체조회 boardList");
		
		List<BoardVo> lists = iService.selectBoardAll(mVo);
//		for (BoardVo vo : lists) {			
//		}
		model.addAttribute("lists",lists);
		return "boardList";
	}
}
