package com.min.edu.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FileVo {
	
	/*
	 * file_seq : 파일 번호
	 * demoboard_seq : 글 번호
	 * original_file_name : 원본 파일 이름
	 * stored_file_name : db에 저장되는 파일 이름
	 * file_size : 저장되는 파일 크기
	 * regdate : 저장되는 날짜
	 * del_gb : 삭제여부
	 */
private int file_seq;
private int demoboard_seq;
private String original_file_name;
private String stored_file_name;
private String file_path;
private String regdate;
private String del_gb;
private MultipartFile file;
}
