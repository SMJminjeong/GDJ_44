package com.min.edu.model.service;

import java.util.List;

import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

public interface IBoardService{

	public List<BoardVo> selectBoardAll(MemberVo mVo);
}
