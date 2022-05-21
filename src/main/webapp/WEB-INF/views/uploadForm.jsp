<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.uploadResult{
	width: 100%;
	background-color: gray;
}
.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li{
	list-style: none;
	padding: 10px;
}
.uploadResult ul li img{
width: 50px;
}
</style>

</head>
<body>
<!-- page-wrapper Start-->
    <div class="page-wrapper" id="pageWrapper">
      <!-- Page Body Start-->
      <div class="page-body-wrapper horizontal-menu">
      <%@ include file="./header.jsp"  %>
      
 <div class="page-body">
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	        <div class="uploadResult">
        	<ul>
        	</ul>
        </div>
	<button id="uploadBtn">Upload</button>
        </div>
        

           <%@ include file="./footer.jsp"  %>
      </div>
   </div>
<script>
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}

	var cloneObj = $(".uploadDiv").clone();

	$("#uploadBtn").on("click",function(e){ 
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);


	
	//add File Data to formData
	for(var i = 0; i<files.length; i++){
		if(checkExtension(files[i].name, files[i].size)){
			
		}
		formData.append("uploadFile", files[i]);
	}

	$.ajax({
		url:'./uploadAjaxAction.do',
		processData: false, //서버에 전달되는 데이터는 query string → jQuery 내부적으로 파일 전송시 query String을 전송 x하도록 설정
		contentType: false, //multipart/form-data로 전송되도록 false
		data: formData, //form과 같은 효과를 가져다주는 key/value → <form>
		type: 'post',
		dataType:'json',
		success: function(result){
			//alert("Uploaded");
			console.log(result);
			showUploadedFile(result);
			$(".uploadDiv").html(cloneObj.html());
		}
		
	}); //$.ajax
});

var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(
				function(i, obj){
					if(!obj.file_type){
						str += "<li><img src = './resources/img/attach.png'>"+obj.original_file_name+"</li>";
					}else{
						//str += "<li>"+obj.original_file_name+"</li>";
						var fileCallPath = encodeURIComponent(obj.file_path+"/s_"+obj.stored_file_name+"_"+obj.original_file_name);
						str += "<li><img src = './display.do?fileName="+fileCallPath+"'></li>";
					}
		});
		uploadResult.append(str);
	}


</script>

</body>
</html>