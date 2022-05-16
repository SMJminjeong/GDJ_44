<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.min.edu.vo.*"%>
 <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세조회 페이지</title>
</head>
<%@ include file="./header.jsp"%>
<body>
   <div class="container">
      <h2>게시글 작성</h2>
      <form:form action="./upload.do" method="post" enctype="multipart/form-data" modelAttribute="FileVo">
            <div>
               <h5>작성자 : ${mem.id}</h5>
            </div>
            <div class="field">
               <h5>글 제목</h5>
               <textarea name="title" id="title" rows="1"></textarea>
            </div>
            <div>
               <h5>글 내용</h5>
               <textarea name="content" id="content" rows="7"></textarea>
            </div>



      <div class="upload-btn-wrapper">
         <input type="file" name="file" id="input_file" multiple="multiple" style="height: 100%;" />
      </div>
            <div class="box">
         <div id="dropZone" style="width: 800px; height: 300px; border-style: solid; border-color: black;">
            <div id="fileDragDesc">
               <p>파일을 드래그 해주세요.</p>
            </div>
            </div>
         </div>
         
         <ul class="actions">
               <li><input type="submit" value="COMPLETE" class="primary" /></li>
               <li><input type="reset" value="RESET" /></li>
               <li><input type="reset" value="CANCEL" /></li>
         </ul>
      </form:form>
         

   </div>


</body>
</html>