package com.min.edu.model.service;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.min.edu.vo.UploadFileVo;

@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate 작동작동");
		UploadFileVo file = (UploadFileVo) target;
		System.out.println("[ file.getFile().getSize() ] : "+file.getFile().getSize());
		if(file.getFile().getSize()==0) { // 파일이 없다면
			errors.rejectValue("file", "errorCode","파일을 선택해주세요");
		}

	}

}
