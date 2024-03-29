INSERT INTO SUBJECT (SUB_NUM, SUB_TITLE, SUB_CONTENT, 
					 SUB_COD_CODE, SUB_REGDATE,SUB_REG_ID, 
					 SUB_REG_CODE, SUB_STATUS) 
			VALUES (TO_CHAR(SYSDATE,'yyyyMMdd')||'SUB'||SUB_SEQ.NEXTVAL,'강사 과목등록 쿼리테스트','강사 과목등록 쿼리테스트',
					'SUB101',SYSDATE,'thdwndrlrkdtk123',
				'REG'||SUB_REG_SEQ.NEXTVAL,'W');

INSERT INTO SUB_REGISTER(REG_CODE, REG_AUTH,REG_ID)
				VALUES((SELECT MAX(SUB_REG_CODE) FROM SUBJECT s),'ROLE_INSTRUCTOR','thdwndrlrkdtk123');
			
		UPDATE SUBJECT SET SUB_INS = (
								SELECT DISTINCT s.SUB_REG_ID  
									FROM SUBJECT s JOIN SUB_REGISTER sr 
																		ON s.SUB_REG_ID = sr.REG_ID 
								WHERE sr.REG_AUTH ='ROLE_INSTRUCTOR'		
								AND sr.REG_ID = 'thdwndrlrkdtk123'
									)
				WHERE SUB_NUM = '20220601SUB139';

			
			SELECT DISTINCT s.SUB_NUM , s.SUB_REG_ID  FROM SUBJECT s JOIN SUB_REGISTER sr ON s.SUB_REG_ID = sr.REG_ID 
				WHERE sr.REG_AUTH ='ROLE_INSTRUCTOR' AND sr.REG_ID='thdwndrlrkdtk123' AND s.SUB_NUM ='20220601SUB139';

			SELECT SUB_NUM FROM SUBJECT ;
			