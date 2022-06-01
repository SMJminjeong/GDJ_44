package com.min.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.min.edu.model.service.IBoardService;
import com.min.edu.model.service.SubjectService;
import com.min.edu.vo.BoardVo;
import com.min.edu.vo.FileVo;
import com.min.edu.vo.MemberVo;
import com.min.edu.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService sService;
	
	//2) 과목 조회
	//2-1) 과목 전체조회 페이지로 이동
	@RequestMapping(value = "/subjectList.do", method = RequestMethod.GET)
	public String subjectList(MemberVo mVo, Model model) {
		log.info("********* Welcome Board_Controller boardList! SubjectController 과목전체조회페이지로 이동합니다. subSelectSubjectAll *********");
		List<SubjectVo> lists = sService.subSelectAllAdmin(mVo);
		model.addAttribute("lists",lists);
		return "subjectList";
	}

	//1) 과목 등록양식 페이지로 이동
	@RequestMapping(value = "/subjectInsertForm.do", method = RequestMethod.GET)
	public String subInsertForm(MemberVo mVo, Model model) {
		log.info("********* Welcome Board_Controller boardList! subInsertSubject 과목 등록양식 페이지로 이동합니다. subjectInsertForm *********");

		return "subjectInsertForm";
	}

}
