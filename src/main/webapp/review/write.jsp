<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>review</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

.header {
	padding: 20px;
	position: relative;
}

.footer>* {
	background-color: rgb(255, 216, 131);
	padding: 20px;
	position: relative;
}

.ft-ul {
	list-style: none;
	text-align: center;
	height: 100%;
	padding-top: 28px;
	color: black;
	font-size: 12px;
	z-index: 1;
}

.ft-images {
	text-align: center;
}

.board_write .info dl {
	width: 49%;
}

.board_write .info dl:first-child {
	margin-right: 2%;
}

.board_write .title dt, .board_write .info dt {
	display: none;
}

.board_write .title dd, .board_write .info dd {
	width: 100%;
}

.board_write .title input[type="text"], .board_write .info input[type="text"],
	.board_write .info input[type="password"] {
	width: 100%;
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
	font-size: 0;
}

.board_write .title dl {
	font-size: 0;
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 1.4rem;
}

.board_write .title dt, .board_write .info dt {
	width: 100px;
}

.board_write .title dd {
	width: calc(100% - 100px);
}

.board_write .title input[type="text"], .board_write .info input[type="text"],
	.board_write .info input[type="password"] {
	padding: 10px;
	box-sizing: border-box;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write .cont {
	border-bottom: 1px solid #000;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}
</style>
</head>
<body>
</head>
<div class="wrapper">
	<div class="row justify-content-center header">
		<div class="col-lg-4 col-12">
			<img src="images/project_logo.PNG" class="d-block w-100"
				id="main-logo">
		</div>
		<div class="col-lg-8 col-12">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">Boribob</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link" href="#">제품 보기</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
							<li class="nav-item"><a class="nav-link" href="#">회원 가입</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
							<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="#">구독하기</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="board_wrap">
		<div class="board_title">
			<img src="images/review_main.png"
				class="img-responsive center-block/" id="review-logo">
		</div>
		<strong>리뷰</strong>
		<p>보리밥 회원들의 생생한 후기를 들려드립니다.</p>
		<form id="writeForm" action="/writeProc.bo" method="post">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<div
							class="col-2 d-flex justify-content-center align-items-center">
							<h6>제목</h6>
						</div>
						<div class="col-10 p-2">
							<input type="text" placeholder="제목을 입력해주세요" id="review-title"
								name="reviewTitle">
							<div class="row"></div>
						</div>
					</div>
					<div class="cont">
						<textarea class="form-control" id="review-content" name="reviewContent"
							placeholder="어떤 점이 좋았나요?"></textarea>
					</div>
				</div>
			</div>
		</form>
		<!-- <form id="writeForm" action="/writeProc.bo" method="post">
		<div class="container">
			<div class="row">
				<img src="images/review_main.png" class="col-lg-10 d-block w-100"
					id="main-logo">
				<div class="col-2 d-flex justify-content-center align-items-center">
					<h6>제목</h6>
				</div>
				<div class="col-10 p-2">
					<input type="text" class="form-control" id="reviewTitle"
						name="title">
				</div>
			</div>

			<div class="row">
				<div class="col-2 d-flex justify-content-center align-items-center">
					<h6>이미지</h6>
				</div>
				<div class="col-10 p-2">
					<input type="file" class="form-control" name="file">
				</div>
			</div>

			<div class="row">
				<div class="col-2 d-flex justify-content-center align-items-center">
					<h6>내용</h6>
				</div>
				<div class="col-10 p-2">
					<textarea id="content" class="form-control" id="reviewContent"
						name="content"></textarea>
				</div>
			</div>
		</div>
	</form> -->
		<div class="boxBtn">
			<button type="button" class="btn btn-danger" id="btnsave">등록하기</button>
			<button type="button" class="btn btn-secondary" id="btnback">목록</button>

		</div>
		<script>
			$("#btnsave").on("click", function() {
				if ($("#review-title").val() === "") {
					$("#review-title").val("제목없음");
				}
				if ($("#reivew-content").val() === "") {
					alert("내용을 입력하세요.");
					//커서 이동
					$("#review-content").focus();
					return;
				}
				$("#writeForm").submit();
			})

			$("#btnback").on("click", function() {
				const btnback = document.getElementById("btnback");
				location.href = "/review.bo";
			});
		</script>

		<div class="row justify-content-center footer">
			<div class="col-lg-10 col-12">
				<ul class="ft-ul">
					<li>BoriBob Inc. 사랑시 고백구 행복동</li>
					<li>대표 : 보리밥형제들 사업자등록번호 : 780-86-01094</li>
					<li>대표번호 : +82)-665-3430 팩스번호 : +82)-888-3430 홈페이지 :
						petvenience.store.com</li>
					<li>CopyrightⓒBoriBob Inc. All Rights Reserved.</li>
				</ul>
			</div>
			<div class="col-lg-2 col-12">
				<ul class="ft-images">
					<img src="images/facebook_icon.png"
						style="border-color: lightblue;">
					<img src="images/instagram_icon.png"
						style="border-color: lightblue;">
					<img src="images/youtube_icon.png" style="border-color: lightblue;">
				</ul>
				<ul class="ft-ul">
					<li><strong>고객센터</strong></li>
					<li style="height: 8px;"></li>
					<li>오전 10시부터 오후 6시까지</li>
					<li>토요일, 일요일, 공휴일 휴무</li>
				</ul>
			</div>
		</div>

	</div>
	</body>
</html>

</body>

</html>