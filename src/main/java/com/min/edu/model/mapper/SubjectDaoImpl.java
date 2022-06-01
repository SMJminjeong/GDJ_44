package com.min.edu.model.mapper;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private final String NS = "com.min.edu.model.mapper.SubjectDaoImpl.";

	//1) 과목 등록
	//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
	@Override
	public int subInsertSubject(Map<String, Object> map) {
		log.info("========== SubjectDaoImpl/subInsertSubject ==========");
		log.info("========== subInsertSubject : "+map+" ==========");
		return sqlSession.insert(NS+"subInsertSubject", map);
	}

	//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
	@Override
	public int subInsertRegister(Map<String, Object> map) {
		log.info("========== SubjectDaoImpl/subInsertRegister ==========");
		log.info("========== subInsertRegister : "+map+" ==========");
		return sqlSession.insert(NS+"subInsertRegister", map);
	}

	//1-3) 과목 등록시 커리큘럼정보(과목번호,기타내용,상세내용,버전,시간,난이도,첨부파일)입력
	@Override
	public int subInsertCurriculum(Map<String, Object> map) {
		log.info("========== SubjectDaoImpl/subInsertCurriculum ==========");
		log.info("========== subInsertCurriculum : "+map+" ==========");
		return sqlSession.insert(NS+"subInsertCurriculum", map);
	}

	//1-4) 과목 등록시 등록자 회원/강사 구분 후 강사일시 담당강사 등록, 일반회원일시 담당강사 null
	@Override
	public int subUpdateInstructor(Map<String, Object> map) {
		log.info("========== SubjectDaoImpl/subUpdateInstructor ==========");
		log.info("========== subUpdateInstructor : "+map+" ==========");
		return sqlSession.insert(NS+"subUpdateInstructor", map);
	}

}
