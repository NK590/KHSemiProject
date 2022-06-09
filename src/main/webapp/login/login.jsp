<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
<title>Home</title>
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
		<!-- 여기까지 헤더 -->

		<!-- 여기에 바디 코드 짜주셈 -->

		<c:choose>
			<c:when test="${not empty loginSession}">
				<c:if test="${rs eq true}">
					<script>
						alert("로그인 성공");
					</script>
				</c:if>



			</c:when>
			<c:otherwise>
				<c:if test="${rs eq false}">
					<script>
				alert("로그인 실패");
			</script>
				</c:if>
				<form id="loginForm" action="/login.mem" method="post">
					<div class="row">
						<div class="content1" style="border: 1px solid lightgrey">

							<div>로그인</div>
							<div>
								<img src="images/doglogin1.jpg"
									style="width: 50px; background-color: rgb(255, 252, 221);">
							</div>
							<input type="text" id="id" name="id" placeholder="이메일을 입력해주세요."
								style="width: 200px;"><br>
							<div>
								<img src="images/catlogin.webp"
									style="width: 50px; background-color: rgb(255, 252, 221);">
							</div>
							<input type="password" id="password" name="password"
								placeholder="비밀번호를 입력해주세요."
								style="width: 200px; margin-top: 5px;">
							<div class="customeritem">
								<br>

								<button type="button" id="loginBtn" class="btn btn-secondary"
									style="margin-left: 110px; text-align: center;">로그인</button>
								<button type="button" id="memberBtn" class="btn btn-success"
									style="text-align: center;">회원가입</button>

								<div style="text-align: center;">
									<input type="checkbox" id="emailSave" name="emailSave">이메일
									저장하기
								</div>

								<div style="text-align: center;" id="search">
									<a class="nav-link" href="/login/login.jsp">아이디/비밀번호 찾기</a>
								</div>
							</div>

						</div>

					</div>
				</form>

				<!-- 캐시를 이용하여 이메일 저장하기 checkbox 활용 -->
				<script type="text/javascript">
     $(function() {         
           fnInit();         
     });
 
    function fnInit(){
        var cookieid = getCookie("emailSave");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='emailSave']").prop("checked", true);
            $('#id').val(cookieid);
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        if(expiredays == 0){
        	document.cookie = name + "=" + escape(value) + "; path=/; max-age=0;";
        }else{
        	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#emailSave").is(":checked")){
            expdate.setTime(expdate.getTime() + 1);
            setCookie("emailSave", $("#id").val(), expdate);
        }else {
           	expdate.setTime(expdate.getTime() - 1);
            setCookie("emailSave", $("#id").val(), 0);
        }
    } 
</script>

				<script>
				
					// 로그인 버튼 눌렀을 때 값 있으면 submit
					$("#loginBtn").on("click", function() {
								if ($("#id").val() === "" || $("#password").val() === "") {
									alert("아이디 혹은 비밀번호를 입력하세요.");
									return;
								}//else if($("#id").val() !== $("#password").val()) {
									//alert("패스워드가 일치하지 않습니다.");
									//return;
								//}
								saveid();
								$("#loginForm").submit();
							})

					document.getElementById("memberBtn").onclick = function() { // 회원가입 누르면 회원가입창으로 이동
						location.href = "/member.mem"; // 로그인하던 회원가입하던 회원과 관련된 컨트롤러에게 보낸기 위한 공통 url(뒤가.mem으로 끝나도록~)
					}		
					
					// 아이디/비밀번호 찾기 버튼 누르면 팝업창 띄우기
					document.getElementById("search").onclick = function() {
						let url = "/searchPopup.mem"; // jsp 경로값 (팝업창 꾸며주는 jsp 필요 **)
						let name = "아이디/비밀번호 찾기"; // 팝업창 이름값
						let option = "width=600, height=300, left=500, top=300"; // 팝업창 크기, 위치
						window.open(url, name, option);
					}
					
				</script>
			</c:otherwise>
		</c:choose>





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
</body>
</html>