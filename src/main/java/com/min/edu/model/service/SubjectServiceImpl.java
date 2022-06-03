package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.model.mapper.SubjectDao;
import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;
import com.min.edu.vo.RowNumVo;
import com.min.edu.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDao sDao;
	
	@Override
	public int subjectTotal() {
		log.info("========== SubjectServiceImpl/subjectTotal ==========");
		return sDao.subjectTotal();
	}
	
	@Transactional
	@Override
	public int subInsertSubject1(Map<String, Object> map) {
		log.info("========== SubjectServiceImpl/subInsertSubject ==========");
		int s = sDao.subInsertSubject(map);
		int r = sDao.subInsertRegister(map);

		return (s>0||r>0)?1:0;
	}
	@Override
	public int subInsertSubject2(Map<String, Object> map) {
		log.info("========== SubjectServiceImpl/subInsertSubject ==========");
		int c = sDao.subInsertCurriculum(map);
		int i = sDao.subUpdateInstructor(map);
		return (c>0||i>0)?1:0;
	}


	//2) 과목 조회
	//2-1) 관리자의 과목 전체목록 조회
	@Override
	public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo) {
		log.info("========== SubjectServiceImpl/subSelectAllAdmin 관리자의 과목 전체목록 조회 ==========");
		return sDao.subSelectAllAdmin(rVo);
	}
	//2-1) 관리자의 과목 상세 조회
	@Override
	public SubjectVo adminSubjectDetail(String sub_num) {
		log.info("========== SubjectServiceImpl/adminSubjectDetail 관리자의 과목 상세 조회 ==========");
		return sDao.adminSubjectDetail(sub_num);
	}
	//2-3) 일반회원의 과목 전체목록 조회
	@Override
	public List<SubjectVo> subSelectAllUser(MemberVo mVo) {
		log.info("========== SubjectServiceImpl/subSelectAllUser 일반회원의 과목 전체목록 조회 ==========");
		return sDao.subSelectAllUser(mVo);
	}
	//2-4) 일반회원의 과목 상세 조회
	@Override
	public SubjectVo comSubjectDetail(String sub_num) {
		log.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 ==========");
		return sDao.comSubjectDetail(sub_num);
	}






}
