package com.min.edu;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.min.edu.model.mapper.SubjectDao;
import com.min.edu.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Subject_Test {

	@Autowired
	private SubjectDao sDao;
	@Autowired
	private DataSourceTransactionManager txManager;
	
//	@Test
	public void test() {
		log.info("Subject_test JUnit Test 실행");
	}
	
	//과목 등록 (과목정보 입력 - 등록자 입력 - 커리큘럼 입력 - 강사 업데이트)
	@Test
	public void subInsertSubject() {
		log.info("subInsertSubject JUnit Test 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub_title", "0602subInsertSubject/sub_title JUnit Test");
		map.put("sub_content", "0602subInsertSubject/sub_content JUnit Test");
		map.put("sub_cod_code", "SUB101");
		map.put("sub_reg_id", "ssoff23247");
		
		int result = sDao.subInsertSubject(map);
		log.info("---------- JUnit Test/Subject_test/subInsertSubject ----------");
		log.info("---------- subInsertSubject 입력된 과목 수 : "+result+" ----------");
		System.out.println(result);
		
		log.info("subInsertRegister JUnit Test 실행");
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("reg_auth", "ROLE_INSTRUCTOR");
		map2.put("reg_id", "ssoff23247");
		
		int result2 = sDao.subInsertRegister(map2);
		log.info("---------- JUnit Test/Subject_test/subInsertRegister ----------");
		log.info("---------- subInsertRegister 입력된 등록자 수 : "+result2+" ----------");
		System.out.println(result2);
		
		log.info("subInsertCurriculum JUnit Test 실행");
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("cur_detail", "0602subInsertSubject/cur_detail JUnit Test");
		map3.put("cur_subcontent", "0602subInsertSubject/cur_subcontent JUnit Test");
		map3.put("cur_version", "cur_version");
		map3.put("cur_time", "cur_time");
		map3.put("cur_level", "cur_level");
		map3.put("cur_file", "cur_file");
		
		int result3 = sDao.subInsertCurriculum(map3);
		log.info("---------- JUnit Test/Subject_test/subInsertCurriculum ----------");
		log.info("---------- subInsertCurriculum 입력된 커리큘럼 수 : "+result3+" ----------");
		System.out.println(result3);
		
		log.info("subInsertCurriculum JUnit Test 실행");
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("reg_auth", "ROLE_INSTRUCTOR");
		map4.put("sub_reg_id", "ssoff23247");
		
		int result4 = sDao.subUpdateInstructor(map4);
		log.info("---------- JUnit Test/Subject_test/subUpdateInstructor ----------");
		log.info("---------- subUpdateInstructor 입력된 담당강사 수 : "+result4+" ----------");
		System.out.println(result4);
	}
	
//	@Test
//	public void subInsertRegister() {
//
//		log.info("subInsertRegister JUnit Test 실행");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("reg_auth", "ROLE_INSTRUCTOR");
//		map.put("reg_id", "ssoff23247");
//		
//		int result = sDao.subInsertRegister(map);
//		log.info("---------- JUnit Test/Subject_test/subInsertRegister ----------");
//		log.info("---------- subInsertRegister 입력된 등록자 수 : "+result+" ----------");
//		System.out.println(result);
//		
//	}
	
//	@Test
//	public void subInsertCurriculum() {
//		DefaultTransactionDefinition definition = new DefaultTransactionDefinition();
//		definition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//		TransactionStatus status = txManager.getTransaction(definition);
//		
//		log.info("subInsertCurriculum JUnit Test 실행");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("cur_detail", "0602subInsertSubject/cur_detail JUnit Test");
//		map.put("cur_subcontent", "0602subInsertSubject/cur_subcontent JUnit Test");
//		map.put("cur_version", "cur_version");
//		map.put("cur_time", "cur_time");
//		map.put("cur_level", "cur_level");
//		map.put("cur_file", "cur_file");
//		
//		int result = sDao.subInsertCurriculum(map);
//		log.info("---------- JUnit Test/Subject_test/subInsertCurriculum ----------");
//		log.info("---------- subInsertCurriculum 입력된 커리큘럼 수 : "+result+" ----------");
//		System.out.println(result);
//		
//		txManager.commit(status);
//	}
	
//	@Test
//	public void subUpdateInstructor() {
//		log.info("subInsertCurriculum JUnit Test 실행");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("reg_auth", "ROLE_INSTRUCTOR");
//		map.put("sub_reg_id", "ssoff23247");
//		
//		int result = sDao.subUpdateInstructor(map);
//		log.info("---------- JUnit Test/Subject_test/subUpdateInstructor ----------");
//		log.info("---------- subUpdateInstructor 입력된 담당강사 수 : "+result+" ----------");
//		System.out.println(result);
//	}
	


}
