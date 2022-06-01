package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.vo.BoardVo;
import com.min.edu.vo.MemberVo;
import com.min.edu.vo.SubjectVo;

public interface SubjectService {
	
	//1) 과목 등록
	//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
	//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
	public int subInsertSubject(Map<String, Object> map);

	//과목 조회
	//2-1) 관리자의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllAdmin(MemberVo mVo);
	//2-2) 과목 상세 조회
	public SubjectVo subSelectDetail(String sub_num);
}
