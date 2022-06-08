<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>레이아웃</title>
<style>
body {
	box-sizing: border-box;
	background-color: rgb(255, 252, 221);
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
</style>
</head>
<body>



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
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="#">제품 보기</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">고객센터</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">회원 가입</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
								<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
								<li class="nav-item"><a class="nav-link" href="#">구독하기</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- 여기까지 헤더 -->

	<!-- 여기에 바디 코드 짜주셈 -->

	<div class="container" style="border: 1px solid lightgrey">
		<form id="memberForm" action="/signup.mem" method="post">
			<div class="row">
				<div class="col-12 mb-5 d-flex justify-content-center">
					<h2>회원 정보 입력</h2>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-12">
					<label for="id" class="form-label">아이디 (이메일)</label>
				</div>
				<div class="col-8 mb-2">
					<input type="text" class="form-control" id="id" name="id" readonly>
				</div>
				<div class="col-4 mb-2">
					<button type="button" id="checkIdBtn" class="btn btn-warning w-100">이메일
						확인</button>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-12">
					<label for="password" class="form-label">비밀번호</label>
				</div>
				<div class="col-12 mb-2">
					<input type="password" class="form-control" id="pw" name="password">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-12">
					<label for="pwCheck" class="form-label">비밀번호 확인</label>
				</div>
				<div class="col-12 mb-2">
					<input type="password" class="form-control" id="pwCheck">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-12">
					<label for="name" class="form-label">이름</label>
				</div>
				<div class="col-12 mb-2">
					<input type="text" class="form-control" id="name" name="name">
				</div>
			</div>


			<div class="row p-2">
				<div class="col">
					<input type="text" class="form-control" id="postCode"
						name="post" placeholder="우편번호">
				</div>

				<div class="col">
					<button type="button" class="btn btn-primary w-100"
						id="btnPostCode">우편번호 찾기</button>
				</div>
				<div class="row p-2">
					<div class="col">
						<input type="text" class="form-control" id="roadAddr"
							name="roadAddress" placeholder="도로명주소">
					</div>
				</div>
				<span id="guide" style="color: #999; display: none"></span>
				<div class="row p-2">
					<div class="col">
						<input type="text" class="form-control" id="detailAddr"
							name="detailAddress" placeholder="상세주소">
					</div>
				</div>
			</div>





			<div class="row p-2">
				<div class="col-12">
					<label for="phone" class="form-label">휴대폰번호</label>
					<div class="col-4 mb-2">
						<select class="form-select" id="phone1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="011">016</option>
							<option value="011">017</option>
							<option value="011">019</option>
						</select>
					</div>
					<div class="col-4 mb-2">
						<input type="text" class="form-control" id="phone2">
					</div>
					<div class="col-4 mb-2">
						<input type="text" class="form-control" id="phone3">
					</div>
					<div class="col d-none">
						<input type="text" id="phone" name="phone">
					</div>

					<div style="border: 1px solid lightgrey; width: 600px; height: 400px;">
						<span>이용약관</span>
					</div>
				</div>

			</div>
		</form>

	</div>

	<div class="row justify-content-center">
		<div class="col-4 d-flex justify-content-end">
			<button type="button" id="cancelBtn" class="btn btn-secondary">취소하기</button>
		</div>
		<div class="col-4 d-flex justify-content-start">
			<button type="button" id="submitBtn" class="btn btn-success">가입하기</button>
		</div>


		<!-- 여기부터 풋터 -->
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
					<img src="images/icons8-facebook-new-48.png"
						style="border-color: lightblue;">
					<img src="images/icons8-인스-타-그램-48.png"
						style="border-color: lightblue;">
					<img src="images/icons8-유튜브-재생-48.png"
						style="border-color: lightblue;">

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


	<script>
		// 이메일 확인 버튼 누르면 팝업창 띄우기
		document.getElementById("checkIdBtn").onclick = function() {
			let url = "/idCheckPopup.mem"; // jsp 경로값 (팝업창 꾸며주는 jsp 필요 **)
			let name = "이메일 중복검사"; // 팝업창 이름값
			let option = "width=600, height=300, left=500, top=300"; // 팝업창 크기, 위치
			window.open(url, name, option);
		}

		// 가입 버튼을 눌렀을 때 유효성 검사 후 form 제출
		$("#submitBtn").on("click",	function() {
					let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,20}/; // 비밀번호 정규식 (영문자, 숫자,~!@#$%^&* 6~20자리)
					let regexName = /[ㄱ-힣]{2,5}/; // 이름 정규식 (한글, 2~5자리)
					let regexPhone = /[0-9]{11}/; // 휴대전화 정규식   

					// phone번호 합치기
					// select 박스에서 선택된 값을 가져오는 방법(selected된 옵션의 value값 가져옴)
					let phone = $("#phone1 option:selected").val()
							+ $("#phone2").val() + $("#phone3").val();
					$("#phone").val(phone);

					// 유효성 검사
					if ($("#id").val() === "") {
						alert("이메일을 입력해 주세요.");
						return;
					} else if (!regexPw.test($("#pw").val())) {
						alert("형식에 맞지 않는 비밀번호입니다.");
						return;
					} else if ($("#pwCheck").val() !== $("#pw").val()) {
						alert("비밀번호와 비밀번호 확인창의 값이 일치하지 않습니다.");
						return;
					} else if (!regexName.test($("#name").val())) {
						alert("형식에 맞지 않는 이름입니다.");
						return;
					} else if (!regexPhone.test(phone)) {
						alert("형식에 맞지 않는 휴대폰번호입니다.");
						return;
					} else if ($("#postCode").val() === ""
							|| $("#roadAddr").val() === "") { 
						alert("주소를 입력해 주세요.");
						return;
					}

					// form 제출
					document.getElementById("memberForm").submit();
				})

		$("#btnPostCode").on("click",function() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											//var extraRoadAddr = ''; 

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											//if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
											//    extraRoadAddr += data.bname;
											//}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											//if(data.buildingName !== '' && data.apartment === 'Y'){
											//   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
											//}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											//if(extraRoadAddr !== ''){
											//    extraRoadAddr = ' (' + extraRoadAddr + ')';
											//}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('postCode').value = data.zonecode;
											document.getElementById("roadAddr").value = roadAddr;

											// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
											//if(roadAddr !== ''){
											//    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
											//} else {
											//    document.getElementById("sample4_extraAddress").value = '';
											//}

											var guideTextBox = document
													.getElementById("guide");
											// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
											if (data.autoRoadAddress) {
												var expRoadAddr = data.autoRoadAddress;
												guideTextBox.innerHTML = '(예상 도로명 주소 : '
														+ expRoadAddr + ')';
												guideTextBox.style.display = 'block';

											} else {
												guideTextBox.innerHTML = '';
												guideTextBox.style.display = 'none';
											}
										}
									}).open();
						})
	</script>

</body>
</html>