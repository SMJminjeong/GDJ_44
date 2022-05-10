<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<script type="text/javascript">
	function loginCheck(){
		console.log('로그인 작동합니다');
		var id = document.getElementById('inputId');
		var pw = document.getElementById('inputPw');
		console.log(id.value, pw.value);
		
		var frm = document.forms[0];
		frm.action = "./login.do";
		console.log(frm);
		
		//유효성 검사 후 Ajax 로그인
		if(id.value == "" || id.value.trim() == ""){
			id.value = "";
			id.focus();
			swal ("로그인", "아이디를 입력해주세요.");
		}else if(pw.value == "" || pw.value.trim()==""){
			pw.value="";
			pw.focus();
			swal("로그인", "비밀번호를 입력해주세요.");
		}else{
			$.ajax({
				url:"./loginCheckMap.do",
				method:"post",
				data:"id=" + id.value + "&pw=" + pw.value,
				success : function(msg){
					console.log(msg, typeof msg); //msg 형태 확인
					console.log(msg.isc);
					if(msg.isc == "성공"){
						console.log(msg.isc);
						frm.submit();
					}else{
						swal("로그인", "해당 사용자는 존재하지 않습니다.");
					}
				},
				error:function(){
					swal("로그인", "로그인에 장애가 발생하였습니다.");
				}
			})
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="./header.jsp"%>
		<!-- Main -->
		<div id="main" class="alt">
			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1>LOG - IN</h1>
					</header>
					<!-- Form -->
					<form method="post" action="./login.do">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="id" id="inputId" value=""
									placeholder="Id" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="password" name="pw" id="inputPw" value=""
									placeholder="Password" />
							</div>
						</div>
						<!-- Buttons -->
						<ul class="actions">
						</ul>
						<div class="row">
							<div class="col-6 col-12-xsmall">
								<ul class="actions">
									<li><input type="submit" value="LOG - IN" placeholder="Login" onclick="loginCheck()"/></li>
									<li><input type="reset" value="RESET"/></li>
								</ul>
							</div>
						</div>
					</form>

				</div>
			</section>
		</div>
	</div>
</body>
</html>