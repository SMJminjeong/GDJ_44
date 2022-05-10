package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.model.mapper.IBoardDao;
import com.min.edu.model.mapper.IMemberDao;
import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	private IBoardDao dao;

	@Override
	public List<BoardVo> selectBoardAll(MemberVo mVo) {
		log.info("BoardServiceImpl : selectBoardAll 전체 조회 ");
		return dao.selectBoardAll(mVo);
	}

}
