<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="static/css/bootstrap.css" rel="stylesheet" th:href="@{/css/bootstrap.css}"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico"/>
    <link rel="stylesheet" href="static/assets/css/main.css">
    <script src="static/jquery.sticky.bootstrap.tabs.js"></script>
    <script>
    $(function() {
      var options = { backToTop: true };
      $('.nav-tabs-sticky').stickyTabs(options);
    });
    </script>
<title>E-Prep</title>

</head>
<body>
	<br>
	<br>
<body class="">

	<!-- Header -->
	<jsp:include page="Components/header.jsp" />
	<!-- Nav -->


	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<h1 style="font-family: Stencil Std, fantasy">E-Prep</h1>
			<p>A practical tool for the behind the scenes crew to prepare for
				that perfect shot</p>
		</div>
		<video autoplay="" loop="" muted="" playsinline=""
			src="https://scontent-lax3-1.cdninstagram.com/v/t50.2886-16/31241909_623181748062249_2612623251937880604_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjY0MC5mZWVkLiIsInFlX2dyb3VwcyI6IltcImlnX3dlYl9kZWxpdmVyeV92dHNfb3RmXCJdIn0&_nc_ht=scontent-lax3-1.cdninstagram.com&_nc_cat=109&_nc_ohc=t-lqVIiecT8AX9PdFG5&vs=17943472717029090_1933559590&_nc_vs=HBksFQAYJEdMVzIzQUVwU0xuT3h6WUNBQnpxcmw4QjUwRWtia1lMQUFBRhUAAsgBABUAGCRHRXgxNFFILWV5WGJESndBQVBlZjJYNGNRSUZaYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMBUAABgAFvDYlPr7ssgCFQIoAkMzLBdARWKPXCj1wxgUZGFzaF9iYXNlbGluZV82NDBfdjERAHXqBwA%3D&oe=5F8AE8DE&oh=fd4c4e1ab2dfe56c6134727082c71404"></video>
	</section>

	<!-- Highlights -->
	<section class="wrapper">
		<div class="inner">
			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-ride="carousel" data-interval="2000">
				<div class="carousel-inner">
					<div class="carousel-item">
						<img src="static/images/camera1.jpg" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item active">
						<img src="static/images/camera2.jpg" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item">
						<img src="static/images/craneforest.jpg" class="d-block w-100"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- CTA -->
	<section id="cta" class="wrapper">
		<div class="inner">

			<h2>Curabitur ullamcorper ultricies</h2>
			<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing
				gravida odio porttitor sem non mi integer non faucibus ornare mi ut
				ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien
				lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum
				dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit
				adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu
				faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac
				gravida.</p>
		</div>
	</section>

	<!-- Testimonials -->
	<section class="wrapper">
		<div class="inner">
			<header class="special">
				<h2>Faucibus consequat lorem</h2>
				<p>In arcu accumsan arcu adipiscing accumsan orci ac. Felis id
					enim aliquet. Accumsan ac integer lobortis commodo ornare aliquet
					accumsan erat tempus amet porttitor.</p>
			</header>
			<div class="testimonials">
				<section>
					<div class="content">
						<blockquote>
							<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum
								adipiscing gravida odio porttitor sem non mi integer non
								faucibus.</p>
						</blockquote>
						<div class="author">
							<div class="image">
								<img src="static/images/pic01.jpg" alt="">
							</div>
							<p class="credit">
								- <strong>Jane Doe</strong> <span>CEO - ABC Inc.</span>
							</p>
						</div>
					</div>
				</section>
				<section>
					<div class="content">
						<blockquote>
							<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum
								adipiscing gravida odio porttitor sem non mi integer non
								faucibus.</p>
						</blockquote>
						<div class="author">
							<div class="image">
								<img src="static/images/pic03.jpg" alt="">
							</div>
							<p class="credit">
								- <strong>John Doe</strong> <span>CEO - ABC Inc.</span>
							</p>
						</div>
					</div>
				</section>
				<section>
					<div class="content">
						<blockquote>
							<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum
								adipiscing gravida odio porttitor sem non mi integer non
								faucibus.</p>
						</blockquote>
						<div class="author">
							<div class="image">
								<img src="static/images/pic02.jpg" alt="">
							</div>
							<p class="credit">
								- <strong>Janet Smith</strong> <span>CEO - ABC Inc.</span>
							</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="Components/footer.jsp" />

	<!-- Scripts -->
	<script src="static/assets/js/jquery.min.js"></script>
	<script src="static/assets/js/browser.min.js"></script>
	<script src="static/assets/js/breakpoints.min.js"></script>
	<script src="static/assets/js/util.js"></script>
	<script src="static/assets/js/main.js"></script>
	    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	<script type="text/javascript"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="static/js/bootstrap.js" th:href="@{/js/bootstrap.js}"></script>
</body>
</html>