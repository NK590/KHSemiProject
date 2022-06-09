<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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
<title>회원정보 수정</title>
</head>
<style>
.container {
	margin-top: 20px;
}

.line {
	border-bottom: 2px solid black;
}

.btn-area {
	text-align: center;
	margin-top: 40px;
}

.btn-area>button {
	margin: 10px;
	width: 150px;
	border-color: #ffc107;
}

.wrap {
	margin-bottom: 50px;
}
</style>
<body>
	<!-- 마이페이지  -->
	<div class="container">
		<div class="row">
			<!-- 사이드 내비바 -->
			<div class="col-sm-2">
				<span>dnltnzla1@naver.com</span>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/mypage.my">구독 내역 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/inquiryList.iq">회원 활동 내역</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/update.my">회원
							정보 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="/withdrawal.my">회원
							탈퇴</a></li>
				</ul>
			</div>
	<!-- content body -->
	<div class="col-sm-10 wrap">
		<p>
		<h3>회원정보 수정</h3>
		</p>
		<div class="line"></div>

		<!-- 회원정보 수정 container-->
		<div class="container" style="border: 1px solid lightgrey">
			<form id="updateForm" action="/updateProc.my" method="post">
				<div class="row p-2">
					<div class="col-12">
						<label for="id" class="form-label">아이디(이메일)</label>
					</div>
					<div class="col-8 mb-2">
						<input type="text" class="form-control" id="id" name="id"
							value="${dto.id}" readonly>
					</div>
				</div>
				<div class="row p-2">
					<div class="col-12">
						<label for="password" class="form-label">비밀번호 변경</label>
					</div>
					<div class="col-12 mb-2">
						<input type="password" class="form-control" id="pw"
							name="password">
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
						<input type="text" class="form-control" id="name" name="name" value="${dto.name}">
					</div>
				</div>
				<!--  휴대폰 번호  -->
				<div class="row p-2">
					<div class="col-12">
						<label for="phone" class="form-label">휴대폰번호</label>
					</div>
					<div class="col-4">
						<select class="form-select" aria-label="Default select example"
							id="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="011">011</option>
							<option value="018">018</option>
						</select>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="phone2"
							aria-label="First name" maxlength="4">
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="phone3"
							aria-label="First name" maxlength="4">
					</div>
					<div class="col d-none">
						<input type="text" id="phone" name="phone">
					</div>
				</div>
				<!-- 우편번호 -->
				<div class="row p-2">
					<div class="col">
						<input type="text" class="form-control" id="postCode" name="post"
							placeholder="우편번호">
					</div>

					<div class="col">
						<button type="button" class="btn btn-primary w-100"
							id="btnPostCode">우편번호 찾기</button>
					</div>
					<div class="row p-2">
						<div class="col">
							<input type="text" class="form-control" id="roadAddr"
								name="roadAddress" placeholder="도로명주소" value="${dto.roadAddress}">
						</div>
					</div>
					<span id="guide" style="color: #999; display: none"></span>
					<div class="row p-2">
						<div class="col">
							<input type="text" class="form-control" id="detailAddr"
								name="detailAddress" placeholder="상세주소" value="${dto.detailAddress}">
						</div>
					</div>
				</div>
		</div>
		<div class="row">
			<div class="col-12 btn-area">
				<button type="button" class="btn btn-light">취소하기</button>
				<button type="button" class="btn btn-warning " id="btnUpdate">수정하기</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	</form>
	<script>
	
      // 가입 버튼을 눌렀을 때 유효성 검사 후 form 제출
      $("#btnUpdate").on("click",function() {
               let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,20}/; // 비밀번호 정규식 (영문자, 숫자,~!@#$%^&* 6~20자리)
               let regexName = /[ㄱ-힣]{2,5}/; // 이름 정규식 (한글, 2~5자리)
               let regexPhone = /[0-9]{11}/; // 휴대전화 정규식   

               // phone번호 합치기
               // select 박스에서 선택된 값을 가져오는 방법(selected된 옵션의 value값 가져옴)
               let phone = $("#phone1 option:selected").val()
                     + $("#phone2").val() + $("#phone3").val();
               $("#phone").val(phone);

               // 유효성 검사
               
                if (!regexPw.test($("#pw").val())) {
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
               $("#updateForm").submit();
              
               
            })
            
            
            
     // 주소 API
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































