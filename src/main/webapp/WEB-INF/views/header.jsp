<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"  type="text/css" href="./css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
</head>
<body>
	<!-- Header -->
					<header id="header" class="alt">
						<a href="./main.do" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
						
						<nav>
		        		  
		        		  <!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="index.html">Home</a></li>
							<li><a href="landing.html">Landing</a></li>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
						<ul class="actions stacked">
							<li><a href="#" class="button primary fit">Get Started</a></li>
							<li><a href="#" class="button fit">Log In</a></li>
						</ul>
					</nav>
							<a href="#menu">Menu</a>
											<ul>
								<c:if test="${mem!=null}">
								<li><a href="./boardList.do" class="button primary">BOARD</a></li>
								<li><a href="./boardWriteForm.do">글작성</a></li>	
									<span>${mem.name}님 환영합니다! (${mem.auth=='ROLE_USER'?"사용자":"관리자"})</span>
									<li><a href="./logout.do" class="button primary">LOG - OUT</a></li>
									
								</c:if>
								<c:if test="${mem == null}">
									<li><a href="./loginForm.do" class="button primary">LOG-IN</a></li>
										<li><a href="#" class="button primary">SIGN - UP</a></li>
								</c:if>
						</ul>
						</nav>
					</header>
</body>
</html>