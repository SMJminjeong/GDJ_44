package com.min.edu.model.mapper;

import java.util.List;

import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

public interface IBoardDao {

	public List<BoardVo> selectBoardAll(MemberVo mVo);
}
