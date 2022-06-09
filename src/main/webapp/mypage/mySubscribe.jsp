<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>마이페이지</title>
</head>
<style>
.container {
	margin-top: 100px;
}

.line {
	border-bottom: 2px solid black;
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
					<li class="nav-item"><a class="nav-link" aria-current="page" href="#">주문 내역 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/inquiryList.iq">내가 쓴 문의</a></li>
					<li class="nav-item"><a class="nav-link" href="/reviewList.bo">내가 쓴 후기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/update.my">회원정보 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="/withdrawal.my">회원탈퇴</a></li>
				</ul>
			</div>
			<!-- content body -->
			<div class="col-sm-10 wrap">
				<p>
				<h3>구독 내역</h3>
				</p>
				<div class="line">밑줄</div>
				<div class="col-sm-9">
					<c:if test="${subscribe eq null}">
						<%-- 구독하고 있지 않을때 --%>
						<div>
							<p>
							<h5>구독한 상품이 없습니다.</h5>
							</p>
						</div>
					</c:if>
					<c:if test="${subscribe ne null}">
						<%-- 구독 중일때 --%>

						<br>

						<div class="container product-body">
							<div class="row row-product-body">
								<div class="col-lg-3 col-md-6">
									<div class="card">
										<img src="${product.productImg}" class="card-img-top"
											alt="...">
										<div class="card-body">
											<p class="card-text">${product.productName}</p>
											<p class="card-text">${subscribe.subscribeStart}</p>
											<p class="card-text">${subscribe.subscribeTerm}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>











