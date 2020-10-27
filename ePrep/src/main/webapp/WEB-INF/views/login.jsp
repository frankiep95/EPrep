<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Log In</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="static/assets/css/main.css">

</head>

<body class="">


	<!-- Header -->
	<jsp:include page="Components/header.jsp" />
	<!-- end header -->

	<div id="heading">
	<h1>Login</h1>
	</div>

	<!-- Main Container -->
	<section id="main" class="wrapper">
		<div class="inner">
			<div class="content">

				<h3>${msg}</h3>
				<form action="login" method="POST">
					<div class="content">
						<p>If you have an account with us, please log in.</p>
						<ul class="form-list">
							<li><label for="email">Email Address <span
									class="required">*</span></label> <br> <input type="email"
								title="E-Mail" placeholder="E-Mail" class="input-text"
								id="email" name="email"></li>
							<li><label for="password">Password <span
									class="required">*</span></label> <br> <input type="password"
								title="" id="pass" class="input-text" name="password"></li>
						</ul>
						<p class="required">* Required Fields</p>
						<div class="buttons-set">
							<button id="send2" type="submit" class="button login">
								<span>Login</span>
							</button>
							<a class="forgot-word" href="#">Forgot Your Password?</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</section>
				<jsp:include page="Components/footer.jsp" />

</body>
</html>
