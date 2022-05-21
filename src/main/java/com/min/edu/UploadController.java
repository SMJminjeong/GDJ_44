package com.min.edu;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.min.edu.vo.FileVo;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class UploadController {
	
@GetMapping("/uploadForm.do")
public String uploadForm() {
	log.info("********* Welcome UploadController uploadForm! 첨부파일 등록(Ajax) 화면으로 이동합니다. *********");
	
	return "uploadForm";
}

@PostMapping(value = "/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
//ResponseEntity : Http header와 body를 포함하는 클래스 
public ResponseEntity<List<FileVo>> uploadFormPost(MultipartFile[] uploadFile, Model model) {
	//MultipartFile[] 로 for문 이용해서 다중 업로드 해준다.
	
	List<FileVo> list = new ArrayList<>();
	
	String uploadFolder = "C:\\upload"; //C에 upload폴더에 저장
	String uploadFolderPath = getFolder();
	//make Folder 폴더 새성 부분 ------------------------------------------------------------
	File uploadPath = new File(uploadFolder, uploadFolderPath);
	log.info("upload path : "+uploadPath);
	
	if(uploadPath.exists()==false) {
		uploadPath.mkdirs();
	} //make yyyy/MM/dd folder생성
	
	for(MultipartFile multipartFile : uploadFile) {
		FileVo fileVo = new FileVo();
		log.info("=============================================================================");
		log.info("Upload File Name : " + multipartFile.getOriginalFilename()); //업로드되는 파일의 이름
		log.info("Upload File Size : " + multipartFile.getSize());//파일의 경로
		
		String uploadFileName = multipartFile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		log.info("only file name : "+ uploadFileName);
		
		fileVo.setOriginal_file_name(uploadFileName);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString()+"_"+uploadFileName;

	try {
		//File saveFile = new File(uploadFolder, uploadFileName);
		File saveFile = new File(uploadPath, uploadFileName);
		multipartFile.transferTo(saveFile); //파일의 저장
		fileVo.setStored_file_name(uuid.toString());
		fileVo.setFile_path(uploadFolderPath);
		
		//check image type file
		if(checkImageType(saveFile)) {
			fileVo.setFile_type(true);
			//원본파일은 그대로 저장 , 파일이름이 s_로 시작되는 섬네일 파일이 생성
			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
			//뒤에 사이즈에 대한 부분을 파라미터로 width, height 지정
			Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
			thumbnail.close();
		}
		//add to list
		list.add(fileVo);
		
	} catch (Exception e) {
		log.error(e.getMessage());
	} //end catch
	
	}//end for
	return new ResponseEntity<>(list, HttpStatus.OK);
}

//yyyy-MM-dd 별로 폴더 생성
private String getFolder() {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String str = sdf.format(date);
	return str.replace("-", File.separator); //다 잘라줌
}

//업로드된 파일이 이미지 종류의 파일인지 확인
//이미지 파일의 경우에는 섬네일 이미지 생성 및 저장
private boolean checkImageType(File file) {
	String contentType;
	try {
		contentType = Files.probeContentType(file.toPath());
		return contentType.startsWith("image");
	} catch (IOException e) {
		e.printStackTrace();
	}
	return false;
}


//섬네일 데이터 전송하기
@GetMapping("/display.do")
@ResponseBody
public ResponseEntity<byte[]> getFile(String fileName){
	log.info("display fileName : "+fileName);
	File file = new File("c:\\upload\\"+fileName);
	log.info("file : "+file);
	ResponseEntity<byte[]> result = null;
	
	HttpHeaders header = new HttpHeaders();
	try {
		header.add("Content-Type", Files.probeContentType(file.toPath())); //적절한 MIME타입 데이터를 Http의 헤더 메시지에 포함
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	} catch (IOException e) {
		e.printStackTrace();
	}
	return result;
}

}
