package com.min.edu.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.model.mapper.SubjectDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDao sDao;
	
	@Transactional
	@Override
	public int subInsertSubject(Map<String, Object> map) {
		log.info("========== SubjectServiceImpl/subInsertSubject ==========");
		int s = sDao.subInsertSubject(map);
		int r = sDao.subInsertRegister(map);
		int c = sDao.subInsertCurriculum(map);
		int i = sDao.subUpdateInstructor(map);
		return (s>0||r>0||c>0||i>0)?1:0;
	}

}
