package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;
import com.min.edu.vo.RowNumVo;
import com.min.edu.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private final String NS = "com.min.edu.model.mapper.SubjectDaoImpl.";

	//0) 페이징 처리를 위한 과목 전체 갯수 출력
	@Override
	public int subjectTotal() {
		log.info("========== SubjectDaoImpl/subjectTotal ==========");
		return sqlSession.selectOne(NS+"subjectTotal");
	}
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
	//1-5) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'A'으로 변경
	@Override
	public int subUpdateStatusA(Map<String, Object> map) {
		log.info("========== SubjectDaoImpl/subUpdateStatusA ==========");
		log.info("========== subUpdateStatusA : "+map+" ==========");
		return sqlSession.insert(NS+"subUpdateStatusA", map);
	}

	//2) 과목 조회
	//2-1) 관리자의 과목 전체 목록 조회
	@Override
	public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo) {
		log.info("========== SubjectDaoImpl/subSelectAllAdmin ==========");
		log.info("========== subSelectAllAdmin : "+rVo+" ==========");
		return sqlSession.selectList(NS+"subSelectAllAdmin", rVo);
	}
	//2-2) 관리자의 과목 상세 조회
	@Override
	public SubjectVo adminSubjectDetail(String sub_num) {
		log.info("========== SubjectDaoImpl/adminSubjectDetail ==========");
		log.info("========== adminSubjectDetail : "+sub_num+" ==========");
		return sqlSession.selectOne(NS+"adminSubjectDetail", sub_num);
	}
	//2-3) 일반회원의 과목 전체 목록 조회
	@Override
	public List<SubjectVo> subSelectAllUser(MemberVo mVo) {
		log.info("========== SubjectDaoImpl/subSelectAllUser ==========");
		log.info("========== subSelectAllUser : "+mVo+" ==========");
		return sqlSession.selectList(NS+"subSelectAllUser", mVo);
	}
	//2-4) 일반회원의 과목 상세 조회
	@Override
	public SubjectVo comSubjectDetail(String sub_num) {
		log.info("========== SubjectDaoImpl/comSubjectDetail ==========");
		log.info("========== comSubjectDetail : "+sub_num+" ==========");
		return sqlSession.selectOne(NS+"comSubjectDetail", sub_num);
	}



}
