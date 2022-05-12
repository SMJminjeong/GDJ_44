package com.min.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.edu.model.service.IBoardService;
import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	private IBoardService iService;
		
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
	
	//2) 게시글 상세조회
	@RequestMapping(value = "/detailBoard.do", method = RequestMethod.GET)
	public String selectBoardDetail(@RequestParam("seq") String id, Model model, String seq) {
		log.info("BoardController 상세조회 getOneBoard");
		BoardVo vo = iService.selectBoardDetail(seq);
		model.addAttribute("vo", vo);
		return "detailBoard";
	}
	
	//3-1) 게시글 새글 등록 화면으로 이동
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite() {
		log.info("Welcome boardWrite! 게시글 새글 등록 화면으로 이동합니다.");
		return "boardWrite";
	}
   // 3-2) 게시글 새글 등록
    @RequestMapping(value = "/boardList.do", method = RequestMethod.POST)
    public String insertBoardRoot(@RequestParam Map<String,Object> map,@SessionAttribute("mem") MemberVo mVo, HttpServletResponse response,HttpSession session) throws IOException {
    	PrintWriter out = response.getWriter();
    	map.put("id", mVo.getId());
       log.info("BoardController 새글 입력 insertBoardRoot", map);
       int n = iService.insertBoardRoot(map);
       if(n>0) {
          session.removeAttribute("row");
          out.println("<script>alert('성공적으로 입력되었습니다'); location.href='./boardList.do'</script>;");
       }else {
    	  out.println("<script>alert('처리가 실패하였습니다'); location.href='./logout.do'</script>;");
    	  out.flush();
       }
       return "redirect:/boardList.do";
    }
  
    @RequestMapping(value = "/logout.do" , method = RequestMethod.GET)
    public String logout(HttpSession session) {
    	log.info("로그아웃한다");
    	session.invalidate();
    	return "redirect:/main.do";
    }


}
