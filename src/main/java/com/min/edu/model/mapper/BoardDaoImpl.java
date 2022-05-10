package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;

@Repository
public class BoardDaoImpl implements IBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "com.min.edu.model.mapper.BoardDaoImpl.";

	@Override
	public List<BoardVo> selectBoardAll(MemberVo mVo) {
		return sqlSession.selectList(NS+"selectBoardAll",mVo);
	}





}
