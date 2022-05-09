<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
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
					<form method="post" action="#">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="demo-name" id="demo-name" value=""
									placeholder="Name" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="email" name="demo-email" id="demo-email" value=""
									placeholder="Email" />
							</div>
						</div>
						<!-- Buttons -->
						<ul class="actions">
						</ul>
						<div class="row">
							<div class="col-6 col-12-xsmall">
								<ul class="actions">
									<li><a href="#" class="button">LOG - IN</a></li>
									<li><a href="#" class="button primary">CANCEL</a></li>
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