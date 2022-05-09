<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>MainPage</title>
</head>
<body>
	<div id="wrapper">
		<%@ include file="./header.jsp"  %>
		<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>Hi, my name is Forty</h1>
							</header>
							<div class="content">
								<p>A responsive site template designed by HTML5 UP<br />
								and released under the Creative Commons.</p>
								<ul class="actions">
									<li><a href="./loginForm.do" class="button next scrolly">LOG-IN</a></li>
									<li><a href="./dragAndDrop.do" class="button next scrolly">Drag & Drop</a></li>
								</ul>
							</div>
						</div>
					</section>
	</div>
	
	
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
