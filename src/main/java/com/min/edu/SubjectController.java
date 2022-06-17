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
import com.min.edu.vo.RowNumVo;
import com.min.edu.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService sService;
	
	//2) 과목 조회
	//2-1) 관리자 과목 전체조회 페이지로 이동
//	@RequestMapping(value = "/subjectList.do", method = RequestMethod.GET)
//	public String subjectList(MemberVo mVo, Model model) {
//		log.info("********* Welcome SubjectController ! subjectList 관리자 과목전체조회페이지로 이동합니다. subSelectAllAdmin *********");
//		List<SubjectVo> lists = sService.subSelectAllAdmin(mVo);
//		model.addAttribute("lists",lists);
//		return "subjectList";
//	}
	//mpa
//	@RequestMapping(value = "/subjectList.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView selectSubjectAdmin(RowNumVo rVo) {
//		ModelAndView mav = new ModelAndView();
//		log.info("********* Welcome SubjectController ! selectSubjectAdmin 관리자 페이징처리 과목전체조회페이지로 이동합니다. selectSubjectAdmin *********");
//		rVo.setTotal(sService.subjectTotal());
//		List<SubjectVo> subLists = sService.subSelectAllAdmin(rVo);
//		mav.addObject("subLists", subLists);
//		mav.addObject("paging", rVo);
//		mav.setViewName("subjectList");
//		return mav;
//	}
	//spa
	@RequestMapping(value = "/subjectList.do", method = RequestMethod.GET)
	public String subjectList(HttpSession session, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("mem");
		log.info("SubjectController subjectList");
		log.info("SubjectController subjectList 세션확인 : {}", mVo);
		
		List<SubjectVo> lists = null;
		RowNumVo rowVo = null;
		
		if(session.getAttribute("row")==null) {
			rowVo = new  RowNumVo();
		}else {
			rowVo=(RowNumVo) session.getAttribute("row");
		}
		
		if(mVo.getAuth().equals("ROLE_ADMIN")) {
			rowVo.setTotal(sService.subjectTotalAdmin());
			lists=sService.subSelectAllAdmin(rowVo);
		}else if(mVo.getAuth().equals("ROLE_USER")){
			rowVo.setTotal(sService.subjectTotalUser());
			lists=sService.subSelectAllUser(rowVo);
		}
		
		model.addAttribute("lists",lists);
		model.addAttribute("row",rowVo);
		
		return "subjectList";
	}
	
	
	
	//2-2) 관리자 과목 상세조회
//	@RequestMapping(value = "/adminSubjectDetail.do", method = RequestMethod.GET)
//	public String adminSubjectDetail(@RequestParam String sub_num, String id, Model model, HttpSession session) {
//		log.info("********* Welcome SubjectController! adminSubjectDetail 상세조회 subSelectDetail *********");
//		session.setAttribute("sub_num", sub_num);
//		SubjectVo results = sService.adminSubjectDetail(sub_num);
//		model.addAttribute("results", results);
//		System.out.println(results);
//		return "adminSubjectDetail";
//	}
	
	
	//2-3) 일반회원 과목 전체조회 페이지로 이동
	@RequestMapping(value = "/comSubList.do", method = RequestMethod.GET)
	public String comSubList(RowNumVo rVo, Model model) {
		log.info("********* Welcome SubjectController! comSubList 일반회원 과목전체조회페이지로 이동합니다. subSelectAllUser *********");
		List<SubjectVo> list = sService.subSelectAllUser(rVo);
		model.addAttribute("list",list);
		return "commons/comSubList";
	}
	//2-4) 일반회원 과목 상세조회
	@RequestMapping(value = "/comSubjectDetail.do", method = RequestMethod.GET)
	public String comSubjectDetail(@RequestParam String sub_num, String id, Model model, HttpSession session) {
		log.info("********* Welcome SubjectController! comSubjectDetail 상세조회 subSelectDetail *********");
		session.setAttribute("sub_num", sub_num);
		SubjectVo result = sService.comSubjectDetail(sub_num);
		model.addAttribute("result", result);
		System.out.println(result);
		return "commons/comSubjectDetail";
	}

	//1) 과목 등록양식 페이지로 이동
	@RequestMapping(value = "/subjectInsertForm.do", method = RequestMethod.GET)
	public String subInsertForm(MemberVo mVo, Model model) {
		log.info("********* Welcome SubjectController! subInsertForm 과목 등록양식 페이지로 이동합니다. subjectInsertForm *********");

		return "commons/subjectInsertForm";
	}

	
//	@RequestMapping(value = "/subInsertSubject.do", method = RequestMethod.POST)
//	public String subInsertSubject(@RequestParam Map<String, Object> map) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("sub_title", sub_title);
//		map.put("sub_content", sub_content);
//		map.put("cur_version", cur_version);
//		map.put("cur_time", cur_time);
//		map.put("cur_level", cur_level);
//		map.put("cur_detail", cur_detail);
//		map.put("cur_subcontent", cur_subcontent);
//		
//		int n = sService.subInsertSubject1(map);
//		int m = sService.subInsertSubject2(map);
//		System.out.println(n,m);
//		return "redirect:/commons/comSubList.do";
//	}

}
